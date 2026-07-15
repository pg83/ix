{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zutty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/zutty
{% endblock %}

{% block git_commit %}
ed5c793d60890ea24bf9f5fdac37a61b26c42b2c
{% endblock %}

{% block git_sha %}
d7af42fc626673e560cc4d60e6e0ac02a7efa4b8a6befefe9c1f36b8765f7931
{% endblock %}

{% block bld_libs %}
lib/c
lib/freetype
lib/fontconfig
lib/sdl/3
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/python
bin/glslang
{% endblock %}
