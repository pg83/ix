{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/ev
lib/drm
lib/std
lib/seat
lib/udev
lib/input
lib/wayland
lib/xkb/common
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
lib/wayland/protocols
{% endblock %}
