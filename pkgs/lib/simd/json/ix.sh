{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
5.0.7
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a5282c9b00f6c8b5217f434636c78ee7c9019f2fd2aa478ba850d2e2584c0994
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
