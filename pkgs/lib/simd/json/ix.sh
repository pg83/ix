{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
5.3.0
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5e59df8bd3fa760937e6a2ca68193399c85b52b5042716700b149a734737dced
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
