import os
import sys


# Best-effort sandbox wrapper used by the local executor (ce.execute_cmd
# wraps every build cmd as `ix exec -- <real cmd>`). On Linux: unshare
# user+mount+net namespaces so the cmd can't reach the network and any
# stray mounts die with the ns. On other OSes: noop, just exec.
#
# Sandbox-related side effects (ns unshare, uid_map) MUST NOT change
# the cmd's argv — argv feeds the IX node uid hash. Keep this transparent.


def setup_sandbox():
    if sys.platform != 'linux':
        return

    if not hasattr(os, 'unshare'):
        return

    flags = 0

    for name in ('CLONE_NEWUSER', 'CLONE_NEWNS', 'CLONE_NEWNET'):
        flags |= getattr(os, name, 0)

    if not flags:
        return

    try:
        os.unshare(flags)
    except OSError as e:
        print(f'ix exec: unshare failed ({e}), running unsandboxed', file=sys.stderr)

        return

    uid = os.getuid()
    gid = os.getgid()

    try:
        with open('/proc/self/setgroups', 'w') as f:
            f.write('deny\n')

        with open('/proc/self/uid_map', 'w') as f:
            f.write(f'0 {uid} 1\n')

        with open('/proc/self/gid_map', 'w') as f:
            f.write(f'0 {gid} 1\n')
    except OSError as e:
        print(f'ix exec: id_map failed ({e})', file=sys.stderr)


def cli_exec(ctx):
    args = ctx['args']

    if args and args[0] == '--':
        args = args[1:]

    if not args:
        print('usage: ix exec [--] <cmd> [args...]', file=sys.stderr)
        sys.exit(2)

    setup_sandbox()
    os.execvp(args[0], args)
