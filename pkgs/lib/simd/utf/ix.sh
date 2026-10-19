{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdutf
{% endblock %}

{% block version %}
9.3.2
{% endblock %}

{% block fetch %}
https://github.com/simdutf/simdutf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d92a0a4ce216dcebf18af20fed7ea7279fa535683f790fdaeed39827a234f567
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
