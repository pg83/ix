import os
import sys
import subprocess


# Sandbox wrapper used by the local executor. ce.execute_cmd decides
# once per graph whether to wrap; by the time we get here, the host is
# known to support unshare + has a mount binary at the absolute path
# passed via `mount=`. We commit and fail fast — any OSError from
# unshare/uid_map or non-zero from mount aborts with a traceback.
#
# Argv shape (key=value, repeatable for `in`):
#   mount=<abs>         absolute path to mount(8) (resolved by executor)
#   tmpfs=true|false    enable shadow store setup
#   net=true|false      keep network (true) or unshare CLONE_NEWNET
#   tmp=<path>          per-cmd build dir
#   out=<path>          single out_dir; r/w window in shadow mode
#   in=<path>           one declared in_dir; repeat per dep
#
# Shadow layout (tmpfs=true):
#   <build_root>/.shadow/store/<dep-udir>   bind-r/o each in=<dep-udir>
#   <build_root>/.shadow/store/<out-udir>   bind-r/w out=
#   bind <build_root>/.shadow/store → <ix_root>/store


CLONE_NEWNS = 0x00020000
CLONE_NEWUSER = 0x10000000
CLONE_NEWNET = 0x40000000


def log(msg):
    print(f'ix exec: {msg}', file=sys.stderr, flush=True)


def parse_args(argv):
    flags = {'mount': '', 'tmpfs': 'false', 'net': 'true', 'tmp': '', 'out': ''}
    in_dirs = []
    rest = list(argv)

    while rest and rest[0] != '--':
        a = rest.pop(0)
        k, _, v = a.partition('=')

        if k == 'in':
            in_dirs.append(v)
        elif k in flags:
            flags[k] = v
        else:
            log(f'unknown arg {a!r}')
            sys.exit(2)

    if rest and rest[0] == '--':
        rest.pop(0)

    return flags, in_dirs, rest


def mount(mount_bin, *args):
    subprocess.run([mount_bin] + list(args), check=True)


def bind_ro(mount_bin, src, dst):
    mount(mount_bin, '--bind', src, dst)
    mount(mount_bin, '-o', 'remount,bind,ro', dst)


def setup_tmpfs(mount_bin, build_root, ix_root):
    # Tmpfs the WHOLE build dir, not the per-cmd $tmp. The cmd's
    # build template runs `mv $tmp <ix_root>/trash` (fast_rm) early,
    # which would fail with "Resource busy" if $tmp itself were the
    # mountpoint. Mounting the parent makes $tmp a regular subdir on
    # the tmpfs.
    os.makedirs(build_root, exist_ok=True)
    mount(mount_bin, '-t', 'tmpfs', 'tmpfs', build_root)

    # Bind <build_root>/.trash → <ix_root>/trash so the mv lands on
    # the same tmpfs and the rename(2) succeeds. Pattern lifted from
    # the old bld/tmpfs.sh wrapper.
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

    mount(mount_bin, '--bind', shadow_store, real_store)


def setup_sandbox(flags, in_dirs, cmd):
    mount_bin = flags['mount']

    # Capture uid/gid BEFORE unshare. After CLONE_NEWUSER and before
    # uid_map is written, getuid() returns the overflow uid (65534);
    # writing that into uid_map gets EPERM and leaves us as `nobody`
    # inside the ns with no caps.
    uid = os.getuid()
    gid = os.getgid()

    mask = CLONE_NEWUSER | CLONE_NEWNS

    if flags['net'] != 'true':
        mask |= CLONE_NEWNET

    os.unshare(mask)

    with open('/proc/self/setgroups', 'w') as f:
        f.write('deny\n')

    with open('/proc/self/uid_map', 'w') as f:
        f.write(f'0 {uid} 1\n')

    with open('/proc/self/gid_map', 'w') as f:
        f.write(f'0 {gid} 1\n')

    mount(mount_bin, '--make-rprivate', '/')

    if flags['tmpfs'] != 'true':
        return

    tmp = flags['tmp']

    if not tmp:
        return

    build_root = os.path.dirname(tmp)
    ix_root = os.path.dirname(build_root)

    setup_shadow(mount_bin, in_dirs, flags['out'], build_root, ix_root)


def cli_exec(ctx):
    flags, in_dirs, cmd = parse_args(ctx['args'])

    if not cmd:
        print('usage: ix exec [k=v ...] -- <cmd> [args...]', file=sys.stderr)
        sys.exit(2)

    setup_sandbox(flags, in_dirs, cmd)

    os.execvp(cmd[0], cmd)
