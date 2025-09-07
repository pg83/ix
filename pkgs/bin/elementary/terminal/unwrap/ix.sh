{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
terminal
{% endblock %}

{% block version %}
7.1.1
{% endblock %}

{% block fetch %}
https://github.com/elementary/terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
9fc85f51ea142ebea8b1a589b4719d4cc5704a97f8502fcbe9b65c21868536bb
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/vte
lib/gee
lib/handy
lib/granite
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala
bld/glib
bld/gettext
bld/fake(tool_name=xvfb-run)
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/handy/gir
lib/vte/{{gtk_ver}}/gir
lib/granite/{{gtk_ver}}/gir
{% endblock %}
