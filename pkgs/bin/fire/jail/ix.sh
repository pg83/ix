{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
firejail
{% endblock %}

{% block version %}
0.9.74
{% endblock %}

{% block fetch %}
https://github.com/netblue30/firejail/archive/refs/tags/{{self.version().strip()}}.tar.gz
fa54d64d1a6c9d45d72c37d1b8135c50f6e9468e75db7b2dd5ee66983f5a23dd
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block postinstall %}
:
{% endblock %}
