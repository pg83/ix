{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
shitty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/shitty
{% endblock %}

{% block git_commit %}
74d98246b2d5af573cbe3a6616215a981f115682
{% endblock %}

{% block git_sha %}
0c08085cc429aec346d7cdc0babb7a9ebf3f1d8f5e9269820537d063d638b1cf
{% endblock %}

{% block pybuild_target %}
zutty
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
