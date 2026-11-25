{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprgraphics
{% endblock %}

{% block version %}
0.7.0
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprgraphics/archive/refs/tags/v{{self.version().strip()}}.tar.gz
fea19225b0bf46912e8a78f3ab35aa1680f5517c6c207b997ac4b4f088de1a02
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/jpeg
lib/webp
lib/spng
lib/magic
lib/cairo
lib/pixman
lib/drm
lib/pango
lib/opengl
lib/hypr/utils
lib/hypr/rsvg
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block patch %}
prepend src/color/Color.cpp << EOF
#include <algorithm>
EOF
{% endblock %}
