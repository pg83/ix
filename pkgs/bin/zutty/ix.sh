{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
zutty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/zutty
{% endblock %}

{% block git_commit %}
b94723248d63a092d1650b5884ed66fd5090dec6
{% endblock %}

{% block git_sha %}
f84c993274d3bcd70a15f7a0de96e6065e6fc3de517256481e7cd8253739e885
{% endblock %}

{% block bld_libs %}
lib/c
lib/glfw
lib/freetype
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
