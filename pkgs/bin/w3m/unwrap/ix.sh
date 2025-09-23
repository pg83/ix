{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
w3m
{% endblock %}

{% block version %}
0.5.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/w3m/w3m/w3m-{{self.version().strip()}}/w3m-{{self.version().strip()}}.tar.gz
e994d263f2fd2c22febfbe45103526e00145a7674a0fda79c822b97c2770a9e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/intl
lib/curses
lib/boehmgc
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*USE_EGD.*||' -i config.h.in
sed -e 's|.*GC_set_warn_proc.*||' -i main.c
find . -type f | while read l; do
    sed -e 's|file_handle|file_handle_xxx|g' -i ${l}
done
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
{% endblock %}
