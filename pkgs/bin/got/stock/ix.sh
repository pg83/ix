{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
got-portable
{% endblock %}

{% block version %}
0.93
{% endblock %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-{{self.version().strip()}}.tar.gz
c2572726bedfdc177d48482b2a23e5afba534a36918f8eeac24b48da37a920d1
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/bsd
lib/event
lib/curses
lib/openssl
lib/linux/util
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block patch %}
>compat/reallocarray.c
>compat/getprogname.c
sed -e 's|set_panel_userptr(view->panel, view)|set_panel_userptr(view->panel, (char *)view)|' \
    -e 's|view_above = panel_userptr(panel)|view_above = (const struct tog_view *)panel_userptr(panel)|' \
    -i tog/tog.c
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

{% block cpp_missing %}
bsd/stdlib.h
bsd/unistd.h
bsd/stdio.h
{% endblock %}
