import os
import sys
import subprocess


# Best-effort sandbox wrapper used by the local executor (ce.execute_cmd
# wraps every build cmd as `ix exec <flags> -- <real cmd>`). All sandbox
# steps live behind the `--` separator; the inner cmd's argv is
# untouched, so the IX node uid hash stays stable regardless of how this
# wrapper evolves.
#
# Argv shape (key=value, repeatable for `in`):
#   tmpfs=true|false    mount tmpfs at the cmd's $tmp build dir
#   net=true|false      keep network (true) or unshare CLONE_NEWNET
#   tmp=<path>          build dir to tmpfs (typically /ix/build/<uid>)
#   out=<path>          single out_dir; r/w window in shadow mode
#   in=<path>           one declared in_dir; repeat per dep
#
# Decision tree:
#   tmpfs=false                                       → unshare only
#   tmpfs=true + out matches LIGHT_PREFIXES           → light: tmpfs $tmp
#   tmpfs=true + non-light                            → full: shadow + tmpfs $tmp
#
# Shadow layout (full mode):
#   ${tmp}/ix/store/<dep-udir>   bind-r/o each in=<dep-udir>
#   ${tmp}/ix/store/<out-udir>   bind-r/w out=
#   ${tmp}/ix/realm              bind-r/o /ix/realm (best effort)
#   bind ${tmp}/ix → /ix (visible to cmd)
#   tmpfs ${tmp}/ix/build/<own-uid> as the cmd's scratch
#
# Light prefixes match nodes whose cmd argv references absolute paths
# under /ix/store that don't show up in declared in_dirs (fetch/link's
# bootstrap python, bin/boot/* toolchain whose RPATH cycles store).


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
    flags = {'tmpfs': 'false', 'net': 'true', 'tmp': '', 'out': ''}
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


CLONE_NEWNS = 0x00020000
CLONE_NEWUSER = 0x10000000
CLONE_NEWNET = 0x40000000


def write_file(path, data):
    try:
        with open(path, 'w') as f:
            f.write(data)
    except OSError as e:
        log(f'{path} write failed ({e})')

        return False

    return True


def unshare(net):
    if not hasattr(os, 'unshare'):
        log('os.unshare missing; running unsandboxed')

        return False

    # Capture uid/gid BEFORE unshare. After CLONE_NEWUSER and before
    # uid_map is written, getuid() returns the overflow uid (65534),
    # not our real uid — writing that into uid_map gets EPERM and
    # leaves us as `nobody` inside the ns with no caps.
    uid = os.getuid()
    gid = os.getgid()

    mask = CLONE_NEWUSER | CLONE_NEWNS

    if not net:
        mask |= CLONE_NEWNET

    try:
        os.unshare(mask)
    except OSError as e:
        log(f'unshare(0x{mask:x}) failed ({e}); running unsandboxed')

        return False

    if not write_file('/proc/self/setgroups', 'deny\n'):
        return False

    if not write_file('/proc/self/uid_map', f'0 {uid} 1\n'):
        return False

    if not write_file('/proc/self/gid_map', f'0 {gid} 1\n'):
        return False

    try:
        subprocess.run(['mount', '--make-rprivate', '/'], check=True)
    except (FileNotFoundError, subprocess.CalledProcessError) as e:
        log(f'make-rprivate failed ({e}); running unsandboxed')

        return False

    return True


def mount(*args):
    subprocess.run(['mount'] + list(args), check=True)


def bind_ro(src, dst):
    mount('--bind', src, dst)
    mount('-o', 'remount,bind,ro', dst)


def setup_tmpfs(tmp):
    if not tmp:
        return

    os.makedirs(tmp, exist_ok=True)
    mount('-t', 'tmpfs', 'tmpfs', tmp)


def setup_shadow(in_dirs, out_dir, tmp):
    if not tmp:
        log('shadow requested but tmp= empty; falling back to light')
        return

    shadow = os.path.join(tmp, 'ix')
    os.makedirs(shadow + '/store', exist_ok=True)
    os.makedirs(shadow + '/build', exist_ok=True)

    for d in in_dirs:
        target = shadow + '/store/' + os.path.basename(d)
        os.makedirs(target, exist_ok=True)
        bind_ro(d, target)

    if out_dir:
        os.makedirs(out_dir, exist_ok=True)
        target = shadow + '/store/' + os.path.basename(out_dir)
        os.makedirs(target, exist_ok=True)
        mount('--bind', out_dir, target)

    if os.path.isdir('/ix/realm'):
        target = shadow + '/realm'
        os.makedirs(target, exist_ok=True)
        bind_ro('/ix/realm', target)

    mount('--bind', shadow, '/ix')


def setup_sandbox(flags, in_dirs):
    if sys.platform != 'linux':
        return

    if not unshare(flags['net'] == 'true'):
        return

    if flags['tmpfs'] != 'true':
        return

    if is_light(flags['out']):
        setup_tmpfs(flags['tmp'])

        return

    setup_shadow(in_dirs, flags['out'], flags['tmp'])
    setup_tmpfs(flags['tmp'])


def cli_exec(ctx):
    flags, in_dirs, cmd = parse_args(ctx['args'])

    if not cmd:
        print('usage: ix exec [k=v ...] -- <cmd> [args...]', file=sys.stderr)
        sys.exit(2)

    setup_sandbox(flags, in_dirs)

    os.execvp(cmd[0], cmd)
