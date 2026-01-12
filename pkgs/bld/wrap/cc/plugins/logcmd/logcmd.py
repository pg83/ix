#!/usr/bin/env python3

import os
import sys
import json

req = json.loads(sys.stdin.read())

if req['step'] == 'configure':
    sys.exit(0)

if '-o' in req['cmd']:
    req['env'] = dict(os.environ.items())

    with open(os.environ['tmp'] + '/' + req['uuid'], 'w') as f:
        f.write(json.dumps(req, indent=4, sort_keys=True))
