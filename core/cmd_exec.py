import os
import sys
import json
import subprocess


# Sandbox wrapper used by the local executor. The parent (execute.py)
# always wraps the cmd via `ix exec` when a mount binary is available;
# the full graph node + cmd dict is delivered as JSON on stdin. This
# wrapper decides what to do based on node['isolate'] / node['tmpfs'],
# sets up unshare + mounts, then forks a stdin-feeder and execve's the
# inner cmd with cmd['env'] (PATH lookup uses the JSON's PATH, not the
# wrapper's process environ).
#
# stdin JSON shape:
#   {
#     "mount": "<abs path to mount(8)>",
#     "node": <full graph node dict>,
#     "cmd":  <one entry from node['cmd']>,
#     "env":  <merged env for the inner cmd, includes make_thrs/IX_RANDOM>
#   }
#
# Shadow layout (node.isolate=true):
#   <build_root>/.shadow/store/<dep-udir>   bind-r/o each in_dir
#   <build_root>/.shadow/store/<out-udir>   bind-r/w out_dir
#   bind <build_root>/.shadow/store → <ix_root>/store


CLONE_NEWNS = 0x00020000
CLONE_NEWUSER = 0x10000000
CLONE_NEWNET = 0x40000000


def log(msg):
    print(f'ix exec: {msg}', file=sys.stderr, flush=True)


def mount(mount_bin, *args):
    subprocess.run([mount_bin] + list(args), check=True)


def bind_ro(mount_bin, src, dst):
    mount(mount_bin, '--bind', src, dst)
    mount(mount_bin, '-o', 'remount,bind,ro', dst)


def setup_tmpfs(mount_bin, build_root, ix_root):
    # Tmpfs build_root (parent of $tmp), not $tmp itself. The cmd's
    # template runs fast_rm on $tmp, which falls back to `rm -rf` on
    # mv failure; rmdir on a mountpoint returns EBUSY, so making $tmp
    # the mountpoint breaks cleanup. With tmpfs on the parent, $tmp is
    # a regular subdir on the tmpfs and fast_rm works.
    os.makedirs(build_root, exist_ok=True)
    mount(mount_bin, '-t', 'tmpfs', 'tmpfs', build_root)

    # Bind <build_root>/.trash → <ix_root>/trash so fast_rm's mv lands
    # on the same tmpfs and rename(2) succeeds.
    trash_inside = os.path.join(build_root, '.trash')
    os.makedirs(trash_inside)

    trash = os.path.join(ix_root, 'trash')
    os.makedirs(trash, exist_ok=True)
    mount(mount_bin, '--bind', trash_inside, trash)


def setup_shadow(mount_bin, in_dirs, out_dir, build_root, ix_root):
    # Shadow <ix_root>/store with only declared in_dirs (r/o) plus the
    # node's own out_dir (r/w). The shadow root sits at
    # <build_root>/.shadow as a sibling of <uid>/ build subdirs so
    # fast_rm of $tmp doesn't disturb it. /ix itself stays untouched —
    # for the local executor ix_root is something like /home/pg/ix_root,
    # not /ix; system tools under /ix/realm/boot/bin and the system
    # /ix/store keep resolving normally.
    real_store = os.path.join(ix_root, 'store')

    shadow_store = os.path.join(build_root, '.shadow', 'store')
    os.makedirs(shadow_store, exist_ok=True)

    for d in in_dirs:
        target = os.path.join(shadow_store, os.path.basename(d))
        os.makedirs(target, exist_ok=True)
        bind_ro(mount_bin, d, target)

    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
        target = os.path.join(shadow_store, os.path.basename(out_dir))
        os.makedirs(target, exist_ok=True)
        mount(mount_bin, '--bind', out_dir, target)

    mount(mount_bin, '--rbind', shadow_store, real_store)


def setup_sandbox(cfg):
    node = cfg['node']

    if not (node['isolate'] or node['tmpfs']):
        return

    mount_bin = cfg['mount']

    # Capture uid/gid BEFORE unshare. After CLONE_NEWUSER and before
    # uid_map is written, getuid() returns the overflow uid (65534).
    uid = os.getuid()
    gid = os.getgid()

    mask = CLONE_NEWUSER | CLONE_NEWNS

    if node['pool'] != 'network':
        mask |= CLONE_NEWNET

    os.unshare(mask)

    with open('/proc/self/setgroups', 'w') as f:
        f.write('deny\n')

    with open('/proc/self/uid_map', 'w') as f:
        f.write(f'0 {uid} 1\n')

    with open('/proc/self/gid_map', 'w') as f:
        f.write(f'0 {gid} 1\n')

    mount(mount_bin, '--make-rprivate', '/')

    tmp = node['tmp']
    build_root = os.path.dirname(tmp)
    ix_root = os.path.dirname(build_root)

    if node['tmpfs']:
        setup_tmpfs(mount_bin, build_root, ix_root)

    if node['isolate']:
        out_dirs = node['out_dir']
        out_dir = out_dirs[0] if out_dirs else ''
        setup_shadow(mount_bin, node['in_dir'], out_dir, build_root, ix_root)


def lookup_path(prog, path):
    if '/' in prog:
        return prog

    for p in path.split(':'):
        full = os.path.join(p, prog)

        if os.path.isfile(full):
            return full

    raise FileNotFoundError(f'cannot find {prog!r} in PATH={path!r}')


def feed_stdin(data):
    r, w = os.pipe()

    if os.fork() == 0:
        os.close(r)

        while data:
            n = os.write(w, data)
            data = data[n:]

        os.close(w)
        os._exit(0)

    os.close(w)
    os.dup2(r, 0)
    os.close(r)


def cli_exec(ctx):
    cfg = json.load(sys.stdin)

    setup_sandbox(cfg)

    args = list(cfg['cmd']['args'])
    env = cfg['env']
    stdin = cfg['cmd']['stdin'].encode()

    feed_stdin(stdin)

    prog = lookup_path(args[0], env.get('PATH', ''))

    os.execve(prog, args, env)
