{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SPIRV-LLVM-Translator
{% endblock %}

{% block version %}
22.1.7
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2b46118831851f1d43eaf20f05ae9cec4088a666e169d9fe4762b9b21826842b
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
