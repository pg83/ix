{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtmultimedia
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v{{self.version().strip()}}.tar.gz
77086e87a06f358ab37207279e94787750445b9029ff48a9fdf6e8b808a493a4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/declarative
lib/qt/6/shadertools
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6
bld/qt/6/tools/shader
{% endblock %}

{% block env %}
{{super()}}
export QT_PATH="${out}:\${QT_PATH}"
export CPPFLAGS="-I${out}/include/QtMultimedia \${CPPFLAGS}"
{% endblock %}
