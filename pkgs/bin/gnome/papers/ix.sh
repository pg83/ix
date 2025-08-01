{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
Incubator
{% endblock %}

{% block version %}
46.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/Incubator/papers/-/archive/{{self.version().strip()}}/papers-{{self.version().strip()}}.tar.bz2
73b16f0f93479d0b94c3209c595e91dfd805fd3b4eab59551bfda4f2cfb22559
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/dbus
lib/gtk/4
lib/exempi
lib/adwaita
lib/poppler
{% endblock %}

{% block meson_flags %}
thumbnailer=false
previewer=false
nautilus=false
gtk_doc=false
tests=false
introspection=false
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=cargo)
bld/fake(tool_name=itstool)
{% endblock %}

{% block build %}
mkdir -p ${tmp}/obj/shell-rs/src/release
>${tmp}/obj/shell-rs/src/release/papers
{{super()}}
{% endblock %}
