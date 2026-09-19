{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
bmake
{% endblock %}

{% block version %}
20260824
{% endblock %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-{{self.version().strip()}}.tar.gz
76c6253a592dd55741be0b14805b9f7e0eb8442004146a978f24b20f37d2cb72
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
