{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v19.1.0.tar.gz
sha:2e64231db8646d8c220d44136712549b5d4c4194c6ce0e57c4f5ab342beee9a2
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/llvm/19
lib/vulkan/spirv/tools
lib/vulkan/spirv/headers
{% endblock %}

{% block bld_tool %}
bld/spirv/tools
{% endblock %}

{% block cmake_flags %}
LLVM_SPIRV_INCLUDE_TESTS=OFF
LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/
{% endblock %}
