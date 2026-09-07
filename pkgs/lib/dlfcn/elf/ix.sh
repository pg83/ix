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
mkdir -p ${out}/lib/bin
mkdir -p ${out}/include
cp dlfcn ${out}/lib/libdlstub.a
cp lib/dlfcn.h ${out}/include/
# The packer that appends a program to a stub built against this loader.
# It ships here so the container format can never disagree with the code
# that reads it, and lands on PATH for anything with this in lib_deps.
cp dev/solo_pack.py ${out}/lib/bin/solo-pack
chmod +x ${out}/lib/bin/solo-pack
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
{% endblock %}
