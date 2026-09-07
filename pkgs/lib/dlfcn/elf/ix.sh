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
