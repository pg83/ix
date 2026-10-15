{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nano
{% endblock %}

{% block version %}
9.2
{% endblock %}

{% block fetch %}
https://www.nano-editor.org/dist/v{{self.version().strip() | field(0)}}/nano-{{self.version().strip()}}.tar.xz
05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/intl
lib/magic
lib/curses
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/groff
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-utf8
{% endblock %}
