{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swaylock
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://github.com/swaywm/swaylock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
642d9c497f451c7f015ca550362e5250503daddd327846b266db4affd568ab95
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/cairo
lib/wayland
lib/xkb/common
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% block cpp_defines %}
HAVE_GDK_PIXBUF=1
{% endblock %}

{% block cpp_missing %}
# https://github.com/swaywm/sway/issues/5410
wayland-client-protocol.h
{% endblock %}
