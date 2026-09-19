{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcpuid
{% endblock %}

{% block version %}
0.8.2
{% endblock %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f23e212e22ca22942cca87b18decdbce8a76d2b004c344a0789d0d26d14930d6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
