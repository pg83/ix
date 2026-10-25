{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libslirp
{% endblock %}

{% block version %}
4.9.6
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v{{self.version().strip()}}/libslirp-v{{self.version().strip()}}.tar.bz2
d4c5d1473216ab9f59402a671e4d6e2af4497666d5d41fa5bf3431d42fb99327
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
