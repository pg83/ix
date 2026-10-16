{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
21.1.12
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3bfb60cf3d6639e1524884c6ffdc33e4b3f29e784fe9ec3bf5bbfcb01049d3eb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/21
lib/spirv/tools
{% endblock %}

{% block bld_libs %}
lib/spirv/headers/next
{% endblock %}

lib/spirv/headers
{% block bld_tool %}
bld/spirv/tools
{% endblock %}

{% block cmake_flags %}
LLVM_SPIRV_INCLUDE_TESTS=OFF
LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/
{% endblock %}
