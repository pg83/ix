{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libxmp
{% endblock %}

{% block version %}
4.7.3
{% endblock %}

{% block fetch %}
https://github.com/libxmp/libxmp/archive/refs/tags/libxmp-{{self.version().strip()}}.tar.gz
716b013943bac9dbe0616fccf828451d15aa862d5bac42b5286dac4572bfbd8b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
