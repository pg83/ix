#!/usr/bin/env python3

import os
import sys
import subprocess

# for bld/ruby
if 'conftest' not in str(sys.argv):
    print(f'EXELINK {sys.argv}', file=sys.stderr)

lib = os.environ['tmp'] + '/lib'

def it_libs():
    try:
        for x in os.listdir(lib):
            if '.a' in x:
                yield lib + '/' + x
    except FileNotFoundError:
        pass

subprocess.check_call(sys.argv[1:] + ['-L' + lib] + list(it_libs()))
