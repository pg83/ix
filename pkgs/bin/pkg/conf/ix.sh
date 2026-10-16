{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
3.0.9
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
32310a33bb97425ebc0707cb5af59f9dc05d10282dcd4db628a45ed904993dc6
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
