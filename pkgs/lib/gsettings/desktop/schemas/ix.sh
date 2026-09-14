{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gsettings-desktop-schemas
{% endblock %}

{% block version %}
51.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/{{self.version().strip()}}.tar.gz
37b89635253528404e422a5c468fad988a27e32766907b59f17b2ffd5a0a1cfb
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block postinstall %}
: skip it
{% endblock %}
