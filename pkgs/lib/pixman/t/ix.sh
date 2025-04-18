{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pixman
{% endblock %}

{% block version %}
0.44.2
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-{{self.version().strip()}}.tar.gz
sha:6349061ce1a338ab6952b92194d1b0377472244208d47ff25bef86fc71973466
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if riscv64 %}
lib/kernel
{% endif %}
{% endblock %}

{% block meson_flags %}
{% if aarch64 or arm64 %}
gnu-inline-asm=disabled
arm-simd=disabled
neon=disabled
a64-neon=disabled
{% endif %}
{% endblock %}
