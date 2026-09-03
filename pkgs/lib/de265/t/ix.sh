{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libde265
{% endblock %}

{% block version %}
1.1.2
{% endblock %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v{{self.version().strip()}}.tar.gz
982f7838cc25aa6bda7fd33b9b3a05621d0f9b8456dc495d5fb4977fed6dcdbc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block cmake_flags %}
{% if not x86_64 %}
DISABLE_SSE=ON
{% endif %}
{% endblock %}
