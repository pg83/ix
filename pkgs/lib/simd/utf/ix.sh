{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.3.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f05b3549465f1bb3c5033a05395c372c0982ed1d166608185b3cc8c5c7e98071
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
