{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
epiphany
{% endblock %}

{% block version %}
51.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/refs/tags/{{self.version().strip()}}.tar.gz
9a2d40739f6e910f3009ffe1e2b18be3d4d08f54aa85554a51cd750f6014f67a
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gmp
lib/gcr
lib/glib
lib/xml/2
lib/cairo
lib/portal
lib/soup/3
lib/nettle
lib/secret
lib/archive
lib/sqlite/3
lib/gtk/deps
lib/json/glib
lib/gdk/pixbuf
lib/web/kit/gtk
lib/glib/networking
lib/gsettings/desktop/schemas
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block use_data %}
aux/iso/codes
{% endblock %}

{% block meson_flags %}
unit_tests=disabled
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/bin/bin_*
{% endblock %}
