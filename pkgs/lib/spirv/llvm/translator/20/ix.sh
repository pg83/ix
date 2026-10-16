{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
20.1.18
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6704bef05b20ca52afd0fb134876959a8f63ed7a70829a1cbc04e70ea719635b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/20
lib/spirv/tools
lib/spirv/headers
{% endblock %}

{% block bld_tool %}
bld/spirv/tools
{% endblock %}

{% block cmake_flags %}
LLVM_SPIRV_INCLUDE_TESTS=OFF
LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/
{% endblock %}
