{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdex
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/{{self.version().strip()}}/libdex-{{self.version().strip()}}.tar.bz2
0b3b12403ddeac30e5a18ba84010099e2986c07547cc714aeb7ed3b5de40c60c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/uring
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
examples=false
vapi=false
introspection=disabled
tests=false
{% endblock %}
