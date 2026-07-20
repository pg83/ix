{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
zutty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/zutty
{% endblock %}

{% block git_commit %}
19a461884c0705b2bd7b27061fbb9a8e531442e2
{% endblock %}

{% block git_sha %}
f5eccd51f2bd4c7b8444987997fe21a195dcc320c364ef7eac4246fd411a3d30
{% endblock %}

{% block git_hook_1 %}
git config submodule.third_party/libstd.url https://github.com/pg83/std.git
{% endblock %}

{% block bld_libs %}
lib/c
lib/glfw
lib/freetype
lib/utf8/proc
lib/linux/headers
lib/glfw/deps
lib/fontconfig
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/glslang
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
mkdir -p ${out}/share/applications
mkdir -p ${out}/share/icons/hicolor/scalable/apps
cp zutty ${out}/bin/
cp zutty.desktop ${out}/share/applications/
cp zutty.svg ${out}/share/icons/hicolor/scalable/apps/
{% endblock %}
