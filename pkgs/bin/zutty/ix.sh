{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
zutty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/zutty
{% endblock %}

{% block git_commit %}
2bc5038a102117a71b7ae4cf6bcb48aebb796fd7
{% endblock %}

{% block git_sha %}
ecc12242bb6b4b9030f5af6cd449b2cdb2590976d4e216032f2bc9bcb648209b
{% endblock %}

{% block bld_libs %}
lib/c
lib/freetype
lib/fontconfig
lib/glfw
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
