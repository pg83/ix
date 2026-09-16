{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glibmm
{% endblock %}

{% block version %}
2.66.6
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.66/glibmm-{{self.version().strip()}}.tar.xz
5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/2
{% endblock %}

{% block patch %}
# GLib 2.90 declares these final-type class typedefs itself.
sed -i \
    -e 's|^using GDBusActionGroup =.*|#include <gio/gio.h>|' \
    -e '/^using GDBusActionGroupClass =/d' \
    untracked/gio/giomm/dbusactiongroup.h
sed -i \
    -e 's|^using GEmblem =.*|#include <gio/gio.h>|' \
    -e '/^using GEmblemClass =/d' \
    untracked/gio/giomm/emblem.h
{% endblock %}
