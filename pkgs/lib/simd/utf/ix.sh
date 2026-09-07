{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.1.1
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ec707f17e5083999efbdaf8a9a08d35e71e955b35dbf4b8307d14a7d31e9697f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
