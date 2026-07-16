{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/ev
lib/drm
lib/dbus
lib/sndio
lib/std
lib/seat
lib/udev
lib/input
lib/sdl/3
lib/wayland
lib/lunasvg
lib/freetype
lib/xkb/common
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
lib/wayland/protocols
{% endblock %}
