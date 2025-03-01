{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/aquamarine/archive/refs/tags/v0.7.2.tar.gz
sha:822ce38345bc4c1b95966c79ee72ff18d753aa923c83e9aa64e9d82eebf55a38
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gbm
lib/seat
lib/input
lib/opengl
lib/pixman
lib/wayland
lib/hypr/utils
lib/display/info
lib/shim/fake(lib_name=GL)
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/hypr/wayland/scanner
{% endblock %}

{% block configure %}
export WAYLAND_CLIENT_DIR=$(dirname $(dirname $(which wayland-scanner)))/share/wayland
{{super()}}
{% endblock %}

{% block cmake_flags %}
WAYLAND_CLIENT_DIR=${WAYLAND_CLIENT_DIR}
{% endblock %}

{% block patch %}
sed -e 's|.*pkg.*WAYLAND_CLIENT_DIR.*||' \
    -e 's|OpenGL::OpenGL||' \
    -i CMakeLists.txt
{% endblock %}
