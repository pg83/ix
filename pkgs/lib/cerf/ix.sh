{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libcerf
{% endblock %}

{% block version %}
3.6
{% endblock %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v{{self.version().strip()}}/libcerf-v{{self.version().strip()}}.tar.bz2
cc2bb836a5ec8958f34292ab45085cbbfe420a31b97768576bbd568b7c89c6f2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIB_MAN=OFF
LIB_RUN=OFF
{% endblock %}

{% block patch %}
sed -e 's|add_sub.*test.*||' -i CMakeLists.txt
{% endblock %}
