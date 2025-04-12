{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
zimg
{% endblock %}

{% block version %}
3.0.4
{% endblock %}

{% block fetch %}
https://github.com/sekrit-twc/zimg/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:219d1bc6b7fde1355d72c9b406ebd730a4aed9c21da779660f0a4c851243e32f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
