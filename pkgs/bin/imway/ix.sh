{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
imway
{% endblock %}

{% block git_repo %}
https://github.com/pg83/imway
{% endblock %}

{% block git_commit %}
c79af938aac9df94e12da85ece0f693dadbd6e6d
{% endblock %}

{% block git_sha %}
e22bbb3fdccc08a2503adcb816f04400645ce5646090b1b3fe33bfd6d021e20c
{% endblock %}

{% block git_hook_1 %}
git config submodule.third_party/libstd.url https://github.com/pg83/std.git
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ev
lib/drm
lib/png
lib/std
lib/glfw
lib/dbus
lib/seat
lib/udev
lib/input
lib/sndio
lib/wayland
lib/lunasvg
lib/xkb/common
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
lib/wayland/protocols
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/glslang
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp imway ${out}/bin/
{% endblock %}
