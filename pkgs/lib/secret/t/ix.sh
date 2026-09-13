{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsecret
{% endblock %}

{% block version %}
0.21.8
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/{{self.version().strip()}}/libsecret-{{self.version().strip()}}.tar.bz2
35f9094ef6060deb61930bd76e3bb40fd938681b13ee1d1bff577dabe3297260
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block cpp_missing %}
fcntl.h
{% endblock %}

{% block patch %}
# The installed library is static too; give the test archive a distinct name.
sed -e "s|libsecret_static = static_library('secret-|libsecret_static = static_library('secret-test-|" -i libsecret/meson.build
{% endblock %}

{% block meson_flags %}
manpage=false
gtk_doc=false
debugging=false
introspection=false
{% endblock %}
