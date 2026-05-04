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
#   tmpfs=true|false    mount tmpfs at the cmd's $tmp build dir
#   net=true|false      keep network (true) or unshare CLONE_NEWNET
#   tmp=<path>          build dir to tmpfs (typically /ix/build/<uid>)
#   out=<path>          single out_dir; r/w window in shadow mode
#   in=<path>           one declared in_dir; repeat per dep
#
# Decision tree:
#   tmpfs=false                                   → unshare only
#   tmpfs=true + out matches LIGHT_PREFIXES       → light: tmpfs $tmp
#   tmpfs=true + non-light                        → full: shadow + tmpfs $tmp
#
# Shadow layout (full mode):
#   ${tmp}/ix/store/<dep-udir>   bind-r/o each in=<dep-udir>
#   ${tmp}/ix/store/<out-udir>   bind-r/w out=
#   ${tmp}/ix/realm              bind-r/o /ix/realm (best effort)
#   bind ${tmp}/ix → /ix (visible to cmd)
#   tmpfs ${tmp}/ix/build/<own-uid> as the cmd's scratch


CLONE_NEWNS = 0x00020000
CLONE_NEWUSER = 0x10000000
CLONE_NEWNET = 0x40000000


def log(msg):
    print(f'ix exec: {msg}', file=sys.stderr, flush=True)


def is_light(out_dir):
    # Bootstrap toolchain (bin/boot/*) and graphgen-synthesized helper
    # nodes (fetch via cmd_fetch → -url-, link via cmd_link → -lnk):
    # their cmd argv references absolute /ix/store paths (python, libc,
    # ix itself) that aren't in declared in_dirs, so a full shadow
    # would hide them. Stay in light mode for these.
    return (
        '-bin-boot-' in out_dir
        or '-url-' in out_dir
        or out_dir.endswith('-lnk')
    )


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


def setup_tmpfs(mount_bin, tmp):
    if not tmp:
        return

    os.makedirs(tmp, exist_ok=True)
    mount(mount_bin, '-t', 'tmpfs', 'tmpfs', tmp)


def setup_shadow(mount_bin, in_dirs, out_dir, tmp):
    shadow = os.path.join(tmp, 'ix')
    os.makedirs(shadow + '/store', exist_ok=True)
    os.makedirs(shadow + '/build', exist_ok=True)

    for d in in_dirs:
        target = shadow + '/store/' + os.path.basename(d)
        os.makedirs(target, exist_ok=True)
        bind_ro(mount_bin, d, target)

    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
        target = shadow + '/store/' + os.path.basename(out_dir)
        os.makedirs(target, exist_ok=True)
        mount(mount_bin, '--bind', out_dir, target)

    if os.path.isdir('/ix/realm'):
        target = shadow + '/realm'
        os.makedirs(target, exist_ok=True)
        bind_ro(mount_bin, '/ix/realm', target)

    mount(mount_bin, '--bind', shadow, '/ix')


def setup_sandbox(flags, in_dirs):
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

    if is_light(flags['out']):
        setup_tmpfs(mount_bin, flags['tmp'])
        return

    setup_shadow(mount_bin, in_dirs, flags['out'], flags['tmp'])
    setup_tmpfs(mount_bin, flags['tmp'])


def cli_exec(ctx):
    flags, in_dirs, cmd = parse_args(ctx['args'])

    if not cmd:
        print('usage: ix exec [k=v ...] -- <cmd> [args...]', file=sys.stderr)
        sys.exit(2)

    setup_sandbox(flags, in_dirs)

    os.execvp(cmd[0], cmd)
