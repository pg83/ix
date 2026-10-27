{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
5.0.6
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a2535137f8da93c0a61a6eeb47e96e502e16db89223b64f76b4041d595f797d7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
