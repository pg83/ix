{% extends 't/ix.sh' %}

{% block pybuild_target %}
dlfcn
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block patch %}
sed -e 's|    includes=\["$(B)/lib", \*musl_private_includes\],|    includes=["$(B)/lib"],\n    cflags=[f"-idirafter{path}" for path in musl_private_includes],|' \
    -i build.py
{% endblock %}

{% block install %}
mkdir -p ${out}/lib
mkdir -p ${out}/include
cp dlfcn ${out}/lib/libdlstub.a
cp lib/dlfcn.h ${out}/include/

# The static TLS pad lives in musl_tls.c, and its link position is
# load-bearing: the loader hands a guest executable the ABI slot adjacent
# to the thread pointer, so the pad must be the thread-pointer-proximal
# TLS of the final binary — after every other thread_local on x86-64,
# before them on aarch64. An archive member lands wherever the linker
# first pulls it, which is not a position anyone controls; a plain object
# file goes exactly where the link line puts it. So the member moves out
# of the archive, and lib/dlfcn/elf/pad places it.
ar p ${out}/lib/libdlstub.a musl_tls.c.o > ${out}/lib/solo_musl_tls.o
ar d ${out}/lib/libdlstub.a musl_tls.c.o
{% endblock %}

{% block env %}
export ac_cv_func_dlerror=yes
export ac_cv_func_dlopen=yes
export ac_cv_func_dlsym=yes
export ac_cv_func_dladdr=yes
export ac_cv_func_dlclose=yes
export ac_cv_lib_dl_dlerror=yes
export ac_cv_lib_dl_dlopen=yes
export ac_cv_lib_dl_dlsym=yes
export ac_cv_lib_dl_dladdr=yes
export ac_cv_lib_dl_dlclose=yes
export ac_cv_search_dlopen=-ldl
export SOLO_MUSL_TLS_OBJECT="${out}/lib/solo_musl_tls.o"
{% endblock %}
