{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.9.1.tar.gz
sha:819979c922a0be258aed133d93920bce6a3d3565a60588d6d372ce9db2712cd3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}

{% block meson_flags %}
defaultpath=/var/run/seatd/seatd.sock
{% endblock %}
