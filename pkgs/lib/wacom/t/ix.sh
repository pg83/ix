{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libwacom
{% endblock %}

{% block version %}
2.20.0
{% endblock %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-{{self.version().strip()}}/libwacom-{{self.version().strip()}}.tar.xz
370b45b5e05a91960df0aeb9c9481ae05846aab92ab2d4ec66945a0da4216888
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
