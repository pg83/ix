{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-2.15.05.tar.gz
md5:2e154a96a13bf937d5247467d986bbde
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block patch %}
>nasm.1
>ndisasm.1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
