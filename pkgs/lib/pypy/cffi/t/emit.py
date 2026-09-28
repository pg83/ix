"""Emit a cffi module's C source instead of compiling it to a .so.

The build scripts in lib_pypy end in ffi.compile(), which produces a
shared object. Nothing can dlopen one here, so the module is compiled
into the interpreter instead and its C is all that is wanted. cffi
already knows how to hand that over: emit_c_code() writes the same
source compile() would have built, with both entry points in it --
PyInit_<name> and, under #ifdef PYPY_VERSION, _cffi_pypyinit_<name>.

So: intercept set_source() to get hold of the FFI object the script
built, stop it at compile(), and write the C out.
"""

import os
import runpy
import sys

script = os.path.abspath(sys.argv[1])
output = os.path.abspath(sys.argv[2])

# the build scripts read neighbouring headers and sources by relative path
os.chdir(os.path.dirname(script))
sys.path.insert(0, os.path.dirname(script))

import cffi

captured = {}
set_source = cffi.FFI.set_source


def capture(self, module_name, *args, **kwargs):
    captured['ffi'] = self
    captured['name'] = module_name
    return set_source(self, module_name, *args, **kwargs)


def stop(self, *args, **kwargs):
    raise SystemExit(0)


cffi.FFI.set_source = capture
cffi.FFI.compile = stop

sys.argv = [script]

try:
    runpy.run_path(script, run_name='__main__')
except SystemExit:
    pass

if 'ffi' not in captured:
    raise SystemExit('%s never called set_source()' % (script,))

captured['ffi'].emit_c_code(output)
print('emitted %s from %s' % (captured['name'], script))
