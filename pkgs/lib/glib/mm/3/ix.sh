{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glibmm
{% endblock %}

{% block version %}
2.90.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/{{self.version()[:4]}}/glibmm-{{self.version().strip()}}.tar.xz
e2efa45643f16b9fea2d6299f2f403d672eaeacddf0ff7f8094e1af9b0f5980b
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}
