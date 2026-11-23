{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtwayland
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f8df32c9a4b3a38e7e42e12a7b1395aa12feedc68f6ff7f5f70a3841e4a7048f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/qt/6/base
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
