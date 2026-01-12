#!/usr/bin/env python3

import os
import sys
import json
import hashlib

data = sys.stdin.buffer.read()
req = json.loads(data)

if req['step'] == 'configure':
    sys.exit(0)

cmd = req['cmd']

if '-o' in cmd:
    d = os.environ['tmp'] + '/lnk'

    try:
        os.makedirs(d)
    except Exception as e:
        pass

    with open(d + '/linkcmd_' + hashlib.md5(data).hexdigest(), 'wb') as f:
        f.write(data)
