{# PyPy translated by RPython into one static executable.

   Two things make this build static rather than the upstream default.
   targetpypystandalone suggests translation.shared, which would emit
   libpypy3.12-c.so plus a launcher that dlopens it, so --no-shared is
   not optional here. And the stdlib has to land in share/: die/std's
   postinstall wipes ${out}/lib for a bin package, so --platlibdir=share
   moves the tree find_stdlib() walks up to, exactly as lib/python/3
   does for CPython.

   The cffi part of the stdlib (_ssl, sqlite3, lzma, curses, ...) is a
   separate problem: upstream builds those as .so files after
   translation. They are not built here. #}

{% extends '//die/c/ix.sh' %}

{% include 't/ver.sh' %}

{% block pkg_name %}
pypy
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{# rpython puts -Wl,--export-dynamic on every link it makes, probes and
   pypy-c alike (posix.py _exportsymbols_link_flags). For a static
   binary the flag means nothing, and the registering variant of the
   plugin would walk every object of the translated interpreter and
   emit a dl entry per symbol -- hundreds of thousands of them. Nothing
   here dlsym()s the executable: extension modules resolve their
   references at link time, so drop the flag instead. #}
wrap_rdynamic_fake
{% endblock %}

{# ix hands build steps to assemble through sudo, which on stal/ix is
   ssh into a local sud_server, and that session is dropped after 60
   seconds with no traffic on it. Every other package prints compiler
   output the whole way through; RPython's annotation phase says
   nothing for many minutes and the build dies mid-translation. Keep a
   trickle going for as long as the script runs. (The cleaner fix is
   -I 0 on the sud_server command line in bin/sud.) #}
{% block script_prologue %}
{{super()}}
(
    while true; do
        sleep 30
        echo "[ix] still building {{name}}"
    done
) &
ix_keepalive=$!
trap 'kill ${ix_keepalive} 2>/dev/null || true' EXIT
{% endblock %}

{% block bld_tool %}
bld/pypy/py2
bld/pypy/pycparser
bld/make
bld/pkg/config
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/z
lib/bzip/2
lib/kernel
lib/ncurses
lib/dlfcn
lib/c/dl
{% endblock %}

{% block patch %}
{# vmprof's libbacktrace wants dl_iterate_phdr and a live dynamic section #}
sed -e 's|IS_SUPPORTED = (|IS_SUPPORTED = False and (|' \
    -i rpython/rlib/rvmprof/cintf.py

{# pyexpat asserts at translation time that expat is not the UTF-16
   build, by actually calling XML_ExpatVersion(). The interpreter is not
   translated yet, so the call goes through ll2ctypes, which compiles
   the vendored expat into a temporary .so and dlopens it -- the one
   thing a static host python cannot do. The check is build-time only;
   the translated binary calls into its own linked-in expat. #}
sed -e 's|^\( *\)ver = space.unwrap(interp_pyexpat.get_expat_version(space))|\1ver = "0.0.0"|' \
    -i pypy/module/pyexpat/moduledef.py
grep -n 'ver = ' pypy/module/pyexpat/moduledef.py

{# ll2ctypes builds the function's eci into a .so and dlopens it, which
   a static host python cannot do. Everything it needs is already in
   the translating process -- libc and the RPython runtime arrive
   through lib/c/dl and lib/pypy/syms/dl on bld/pypy/py2, and the
   binary's own symbols through wrap_rdynamic there. So when the
   process-wide dl table already answers, skip the shared library
   entirely and let the existing standard_c_lib fallback take it. #}
sed -e 's|^\( *\)libraries = eci.testonly_libraries + eci.libraries + eci.frameworks|&\n\1if get_on_lib(standard_c_lib, funcname) is not None:\n\1    libraries = []|' \
    -i rpython/rtyper/lltypesystem/ll2ctypes.py
grep -n -A2 'libraries = eci.testonly_libraries' rpython/rtyper/lltypesystem/ll2ctypes.py
{% endblock %}

{% block pypy_opt %}
2
{% endblock %}

{% block build %}
cd pypy/goal
python2 ../../rpython/bin/rpython \
    --opt={{self.pypy_opt().strip()}} \
    --no-shared \
    --cc=cc \
    --make-jobs=${make_thrs} \
    targetpypystandalone \
    --platlibdir=share
{% endblock %}

{% block install %}
STDLIB=${out}/share/pypy{{self.py_ver().strip()}}

mkdir -p ${out}/bin ${STDLIB}

{# driver.exe_name is 'pypy<major>.<minor>-c'; upstream's Makefile
   still says pypy3-c, so take whichever the translation produced #}
cp pypy/goal/pypy3*-c ${out}/bin/pypy{{self.py_ver().strip()}}
ln -s pypy{{self.py_ver().strip()}} ${out}/bin/pypy3
ln -s pypy{{self.py_ver().strip()}} ${out}/bin/pypy

{# the release layout merges both trees into one directory, and drops
   the __init__.py lib_pypy carries for its own sake #}
cp -R lib-python/3/. ${STDLIB}/
cp -R lib_pypy/. ${STDLIB}/
rm -f ${STDLIB}/__init__.py
mkdir -p ${STDLIB}/site-packages

find ${STDLIB} -name '__pycache__' -type d | while read l; do
    rm -rf "${l}"
done
find ${STDLIB} -name '*.pyc' -delete
rm -rf ${STDLIB}/test ${STDLIB}/idlelib ${STDLIB}/tkinter
{% endblock %}
