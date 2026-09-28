{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
inotify-tools
{% endblock %}

{% block version %}
4.26.262
{% endblock %}

{% block fetch %}
https://github.com/inotify-tools/inotify-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
989895241148580c820872ecd4f2b06f3dd8c5d72f61c4852dbf936beb2b067f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}
