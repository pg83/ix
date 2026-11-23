{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qttools
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qttools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7a31bba8823a03e68b4c32a8f56a72b517a03615d9fdfb6c035b311074ab1baa
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base/nogui
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_linguist=ON
QT_FEATURE_designer=OFF
QT_FEATURE_pixeltool=OFF
QT_FEATURE_assistant=OFF
QT_FEATURE_distancefieldgenerator=OFF
QT_FEATURE_qtattributionsscanner=OFF
QT_FEATURE_qtplugininfo=OFF
QT_FEATURE_qdbus=OFF
QT_FEATURE_qtdiag=OFF
{% endblock %}

{% block env %}
export Qt6LinguistTools_DIR="${out}/lib/cmake/Qt6LinguistTools"
{% endblock %}
