{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
3.0.7
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
a9ae678879771fcf15247ac2435e7ad8308be8a5921898e6720b3b8949410f73
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
