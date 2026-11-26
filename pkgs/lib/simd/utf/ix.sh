{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.5.0
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
833a71de6224a3370e7116af1a2c2e666a6a9efe63c41198e6197f7e047674b3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
