{% extends '//die/c/cmake.sh' %}

{% block version %}
133
{% endblock %}

{% block pkg_name %}
binaryen
{% endblock %}

{% block fetch %}
https://github.com/WebAssembly/binaryen/archive/refs/tags/version_{{self.version().strip()}}.tar.gz
2f3e3d9edc56751499571da073a8a81943ca3fcbc08a945d2c619a7a1d4eb88b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
ENABLE_WERROR=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
