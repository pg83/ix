{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ii8/havoc/archive/refs/tags/0.6.0.tar.gz
sha:3f6538eb8a2b5846459f38c283eef2c8152886a4ed079e1038b02d0c31a3247c
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/pkg/config
{% endblock %}
