{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtsvg
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b038a93f1ec8a1914b56f2aecea407ed048dc6f385461276ae1b0f52a201183c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block env %}
{{super()}}
export QT_PATH="${out}:\${QT_PATH}"
export CPPFLAGS="-I${out}/include/QtSvg \${CPPFLAGS}"
{% endblock %}
