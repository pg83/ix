{% extends '//bin/file/host/ix.sh' %}

{% block fetch %}
https://astron.com/pub/file/file-5.45.tar.gz
sha:fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}