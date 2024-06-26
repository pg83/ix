{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaybg/archive/refs/tags/v1.2.1.tar.gz
sha:45c4a1a3b83c86ddc321a6136402b708f195a022d0ccee4641b23d14c3a3c25e
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
