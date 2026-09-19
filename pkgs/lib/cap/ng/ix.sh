{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcap-ng
{% endblock %}

{% block version %}
0.9.6
{% endblock %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
399040138e0ca62fa2bcabd63da9af4431a246ef7a654561a0ca3cb00010a539
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block patch %}
sed -i '/#include <sys\/cdefs.h>/d' utils/gcc-attributes.h
{% endblock %}
