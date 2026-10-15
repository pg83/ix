{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
kmscon
{% endblock %}

{% block version %}
10.0.4
{% endblock %}

{% block fetch %}
https://github.com/kmscon/kmscon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6918c748c26e9c8cfe81783400be3732792a73e532d6235f40c4b332ca4fde0b
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
