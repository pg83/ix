{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qt5compat
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8c5b7f7a2697907e41895fef9f8154f34f37ee74adb0cf63bc96562876bc04ff
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
bld/qt/6/tools/shader
{% endblock %}
