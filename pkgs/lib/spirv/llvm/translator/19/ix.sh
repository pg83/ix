{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
19.1.23
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7c47c694b3c24152eaf55770a134631deae9e7d271417da502ea970f731aa923
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/19
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
