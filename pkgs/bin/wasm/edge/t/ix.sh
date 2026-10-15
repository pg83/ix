{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
WasmEdge
{% endblock %}

{% block version %}
0.18.0
{% endblock %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/{{self.version().strip()}}.tar.gz
3faabd223ba5fd20e6ffc962b1688942499a950b57e15b3c361d571c9b227240
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/zstd
lib/boost
lib/spdlog
{% endblock %}

{% block cmake_flags %}
WASMEDGE_FORCE_DISABLE_LTO=ON
SUPPORT_EXCLUDE_LIBS=OFF
WASMEDGE_BUILD_PLUGINS=OFF
WASMEDGE_LINK_LLVM_STATIC=ON
{% endblock %}

{% block cpp_defines %}
O_SYMLINK=0
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}
