#!/usr/bin/env python3

import os
import sys
import json
import subprocess

args = sys.argv[1:]
pos = args.index('--')
args, extra = args[:pos], args[pos + 1:]

def find_binary(b):
    where = os.environ['tmp']

    for x in sorted(os.listdir(where)):
        print(x, file=sys.stderr)

        if 'plg_logcmd' in x:
            with open(where + '/' + x) as f:
                rec = json.loads(f.read())

            print(rec, file=sys.stderr)

            cmd = rec['cmd']

            if b in cmd:
                return rec

            if '-o' in cmd:
                if os.path.basename(cmd[cmd.index('-o') + 1]) == b:
                    return rec

    raise Exception(f'can not relink unknown binary {b}')

for x in args:
    rec = find_binary(x)
    subprocess.check_call(rec['cmd'] + extra, env=rec['env'], cwd=rec['env']['PWD'])
