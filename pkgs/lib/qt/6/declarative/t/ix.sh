{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtdeclarative
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6378c7427d618f61c2ee2f6f848bf65f0ff38cb5319de6ed86eb35566c7baa9e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/shadertools
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/python
bld/qt/6/tools/shader
{% endblock %}
