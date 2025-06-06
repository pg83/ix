import sys
import random
import importlib
import subprocess

import core.error as ce


CLIS = [
    ('core.cmd_realm', 'dep', True),
    ('core.cmd_realm', 'mut', False),
    ('core.cmd_realm', 'let', False),
    ('core.cmd_realm', 'run', False),
    ('core.cmd_realm', 'list', False),
    ('core.cmd_realm', 'purge', False),
    ('core.cmd_realm', 'build', False),
    ('core.cmd_gc', 'gc', False),
    ('core.cmd_tool', 'tool', False),
    ('core.cmd_tool', 'recache', True),
    ('core.cmd_misc', 'misc_extract', True),
    ('core.cmd_misc', 'misc_fetch', True),
    ('core.cmd_misc', 'misc_link', True),
]


def find_handler(args):
    sent = '$$'
    xargs = sent.join(args)

    for k, v, _ in CLIS:
        vv = v.replace('_', sent)

        if xargs.startswith(vv):
            a = xargs[len(vv):].split(sent)

            while a and a[0] == '':
                a = a[1:]

            return k, v, a


def print_help():
    print('more docs at https://stal-ix.github.io/IX.html')
    print('usage: ix <command>:')

    for k, v, hide in CLIS:
        if not hide:
            print('    ' + v.replace('_', ' '))


def main_func(args, binary):
    hndl = find_handler(args)

    if not hndl:
        print_help()
        sys.exit(1)

    k, v, a = hndl

    ctx = {
        'args': a,
        'binary': binary,
    }

    def run():
        mod = importlib.import_module(k)
        mod.__dict__['cli_' + v](ctx)

    run()


def main(argv, ix):
    try:
        main_func(argv[1:], ix)
    except subprocess.CalledProcessError as e:
        return e.returncode
    except ce.Error as e:
        if e.exception:
            print(f'{e.exception.__class__.__name__}: {e.exception}')

        print(f'{e}')

        return 1
    except KeyboardInterrupt:
        return 1

    return 0
