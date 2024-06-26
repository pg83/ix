{% extends '//die/c/cmake.sh' %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
MBEDTLS_FATAL_WARNINGS=OFF
{% endblock %}

{% block patch %}
cat library/CMakeLists.txt | grep -v no_warning_for_no_symbols > _ && mv _ library/CMakeLists.txt
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
