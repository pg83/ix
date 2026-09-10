{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
upower
{% endblock %}

{% block version %}
1.91.4
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v{{self.version().strip()}}/upower-v{{self.version().strip()}}.tar.bz2
de2cd848c927e267f37d1aa6b52631857055b0a1fc76c0e10e173723d83abeae
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block meson_flags %}
man=false
gtk-doc=false
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block cpp_missing %}
math.h
{% endblock %}
