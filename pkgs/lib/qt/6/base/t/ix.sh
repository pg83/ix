{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtbase
{% endblock %}

{% block version %}
6.12.1
{% endblock %}

{% block fetch %}
https://github.com/qt/qtbase/archive/refs/tags/v{{self.version().strip()}}.tar.gz
70407e008298e9c5f2be993bc380ee7753774ed206aab31cf727d0e3c6dbe380
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/double/conversion
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_reduce_relocations=OFF
QT_FEATURE_static_runtime=ON
QT_FEATURE_static=ON
QT_FEATURE_shared=OFF
QT_FEATURE_doubleconversion=ON
QT_FEATURE_freetype=ON
QT_FEATURE_harfbuzz=ON
QT_FEATURE_jpeg=ON
QT_FEATURE_largefile=ON
QT_FEATURE_png=ON
QT_FEATURE_fontconfig=ON

QT_FEATURE_posix_fallocate=ON
QT_FEATURE_regularexpression=ON
QT_FEATURE_system_doubleconversion=ON
QT_FEATURE_system_freetype=ON
QT_FEATURE_system_harfbuzz=ON
QT_FEATURE_system_jpeg=ON
QT_FEATURE_system_libb2=ON
QT_FEATURE_system_pcre2=ON
QT_FEATURE_system_sqlite=ON
QT_FEATURE_system_zlib=ON
QT_FEATURE_system_fontconfig=ON
QT_FEATURE_systemsemaphore=ON

#QT_FEATURE_system_proxies
#QT_FEATURE_system_textmarkdownreader
#QT_FEATURE_systemtrayicon
#QT_FEATURE_textmarkdownreader
#QT_FEATURE_xcb
{% endblock %}

{% block install %}
{{super()}}
# do not force find-only tools on what builds on top: bld/qt/6/tools* build them
sed -e '/QT_FORCE_FIND_TOOLS/d' -i ${out}/lib/cmake/Qt6BuildInternals/QtBuildInternalsExtra.cmake
{% endblock %}
