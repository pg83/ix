{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
imway
{% endblock %}

{% block git_repo %}
https://github.com/pg83/imway
{% endblock %}

{% block git_commit %}
1
{% endblock %}

{% block git_sha %}
cfbe2f83eec79c4d8e399ddc38238b937837cffbd90cfc25cb30ab283ad7b11b
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
lib/jxl
lib/std
lib/glfw
lib/dbus
lib/seat
lib/pam
lib/udev
lib/input
lib/display/info
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
