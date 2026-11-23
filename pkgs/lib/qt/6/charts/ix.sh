{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtcharts
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v{{self.version().strip()}}.tar.gz
752e3f34b35609239330ff3d803b66906e11dd4537a1f48e34758d6ca3d91893
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/multimedia
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
