{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v0.7.0.tar.gz
sha:cfd9e6bcda5da3f602273e55f983bdd747cb93dde0b9ec06560e074939314210
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
