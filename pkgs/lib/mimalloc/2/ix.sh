{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
mimalloc
{% endblock %}

{% block version %}
2.5.4
{% endblock %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f0052ed540560228e343ed4972c481482bcd8b4e1c5e81393b04d9ef9333f498
{% endblock %}

{% block bld_libs %}
lib/c++/headers
lib/shim/alloc
{% endblock %}

{% block c_rename_symbol %}
strdup
{% endblock %}

{% block cmake_flags %}
MI_USE_CXX=ON
MI_OVERRIDE=ON
MI_BUILD_STATIC=ON
MI_BUILD_SHARED=OFF
MI_BUILD_TESTS=OFF
{% endblock %}

{% block cpp_defines %}
{{super()}}
MI_STAT=0
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv mimalloc-*/* ./
rm -rf mimalloc-*
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-2.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
