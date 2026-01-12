#!/usr/bin/env python3

import os
import sys
import json

def res_path(where, f):
    for x in where:
        p = os.path.join(x, f)

        if os.path.isfile(p):
            return p

def norm(cmd):
    l = []
    o = []

    for x in cmd:
        if x.startswith('-L'):
            l.append(os.path.abspath(x[2:]))
        else:
            o.append(x)

    for x in o:
        if x.startswith('-l'):
            if rp := res_path(l, 'lib' + x[2:] + '.a'):
                yield rp
            elif rp := res_path(l, 'lib' + x[2:] + '.tbd'):
                yield rp
            else:
                raise Exception(f'no {x} in {l}')
        elif x.endswith('.o'):
            yield os.path.abspath(x)
        elif x.endswith('.a'):
            yield os.path.abspath(x)
        elif x.endswith('.c'):
            yield os.path.abspath(x)
        elif x.endswith('.cpp'):
            yield os.path.abspath(x)
        elif x.endswith('.S'):
            yield os.path.abspath(x)
        else:
            yield x

print(json.dumps({
    'cmd': list(norm(json.loads(sys.stdin.read())['cmd'])),
}))
