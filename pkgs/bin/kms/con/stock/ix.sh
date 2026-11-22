{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
kmscon
{% endblock %}

{% block version %}
10.1.2
{% endblock %}

{% block fetch %}
https://github.com/kmscon/kmscon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ba683806d517b1dfc9cfbca0e9d5c2653b62d1fbf41918c00fa1d5c837626044
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/tsm
lib/udev
lib/pango
lib/xkb/common
{% if opengl %}
lib/drivers/3d
{% endif %}
{% endblock %}

{% block modules %}
psf
pango
unifont
freetype
{% endblock %}

{% block meson_flags %}
tests=false
video_drm3d=disabled
renderer_gltex=disabled
{% for m in self.modules() | parse_list %}
font_{{m}}=enabled
{% endfor %}
{% endblock %}
