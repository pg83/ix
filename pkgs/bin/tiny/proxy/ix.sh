{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tinyproxy/tinyproxy/archive/refs/tags/1.11.2.tar.gz
sha:10f4c18fb98db6431c8f0d5f0b9d00fefc98ac1ee270a8452a7c75ef2ba43675
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
