{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
23.1.2
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b657254b5e0a2dda7914a8cb1eace467f22847d75d877b83829026c1452f827a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/llvm/22
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
