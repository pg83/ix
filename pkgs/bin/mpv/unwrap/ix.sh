{% extends '//lib/mpv/t/ix.sh' %}

{% block bld_libs %}
lib/lua
lib/drm
lib/jpeg
lib/sixel
lib/mu/js
lib/opengl
lib/kernel
lib/wayland
lib/blueray
lib/x265/dl
lib/xkb/common
lib/drivers/3d
lib/rubber/band
lib/display/info
{% if vulkan %}
lib/vulkan/headers
{% endif %}
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wayland
{% endblock %}

{% block meson_flags %}
{{super()}}
javascript=enabled
wayland=enabled
egl-wayland=enabled
dmabuf-wayland=enabled
{% endblock %}
