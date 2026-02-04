{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/jeremy-rifkin/cpptrace/archive/refs/tags/v1.0.4.tar.gz
5c9f5b301e903714a4d01f1057b9543fa540f7bfcc5e3f8bd1748e652e24f9ea
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zstd
lib/dwarf
{% endblock %}

{% block cmake_flags %}
CPPTRACE_USE_EXTERNAL_ZSTD=ON
CPPTRACE_USE_EXTERNAL_LIBDWARF=ON
{% endblock %}
