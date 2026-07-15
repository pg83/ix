{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zutty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/zutty
{% endblock %}

{% block git_commit %}
4bf79e7a079ebcfe6d356ad1cf0366f6334ed81f
{% endblock %}

{% block git_sha %}
31f014e5c59a0c4f19752672f727ccaffc0c978a84448ebaf890efb5d93e5b3c
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/3
lib/freetype
lib/fontconfig
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/python
bin/glslang
{% endblock %}
