{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
zutty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/zutty
{% endblock %}

{% block git_commit %}
8e4bc99d94388503d43344dbd1dce72f522fd594
{% endblock %}

{% block git_sha %}
2ba952b2c23dff16d93e08ae12e49db17102ff80111987a0ad7e06f10dcf476a
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
