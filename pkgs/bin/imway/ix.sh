{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
imway
{% endblock %}

{% block git_repo %}
https://github.com/pg83/imway
{% endblock %}

{% block git_commit %}
47ffd4868485f448baef66458e1b0f59ef474b15
{% endblock %}

{% block git_sha %}
275475769bf327e8943d274a429906f5849eca8b62dbb8488a8388af5ea7a9be
{% endblock %}

{% block bld_libs %}
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

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
{{super()}}
sed -e '/enable_testing()/d' \
    -e '/add_subdirectory(dev\/tests)/d' \
    -i CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
IMWAY_USE_VENDORED_STD=OFF
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp {{ninja_build_dir}}/imway ${out}/bin/
{% endblock %}
