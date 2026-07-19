{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
imway
{% endblock %}

{% block git_repo %}
https://github.com/pg83/imway
{% endblock %}

{% block git_commit %}
546860df07d6763d379c73d684649e5fd1cce71b
{% endblock %}

{% block git_sha %}
6565eed4d527bbae969d744c740d49e1de0c875ca408599246386cc2cd74c338
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
