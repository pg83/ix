{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.6.10
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1d560f233ff4a29eae0eaa8b4138bfaa72ca86714a12da6a85654812581e8926
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
