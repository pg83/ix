{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lerc
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/Esri/lerc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a1fb593ed1fcb5b38800caf3c4454f872745202e961d00d745e53d81447e17c9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cpp_missing %}
limits.h
{% endblock %}
