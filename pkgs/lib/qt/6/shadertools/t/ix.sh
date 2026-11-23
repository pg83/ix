{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtshadertools
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtshadertools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2d6bdf572eb4521dd5603ba04d81b0f8a3e750da9075bb2c2a134d921e5432d4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/qt/6/base
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}
