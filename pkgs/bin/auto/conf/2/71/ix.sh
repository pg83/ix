{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
autoconf
{% endblock %}

{% block version %}
2.71
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/autoconf/autoconf-{{self.version().strip()}}.tar.xz
f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4
{% endblock %}

{% block bld_tool %}
bld/m4
bld/perl
bld/texinfo/lite
{% endblock %}

{% block install %}
{{super()}}
find ${out}/bin -type f | while read l; do
    sed -e 's|/.*/store/.*/bin/sh|sh|' -i ${l}
done
{% endblock %}
