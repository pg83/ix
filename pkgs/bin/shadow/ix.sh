{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
shadow
{% endblock %}

{% block version %}
4.20.4
{% endblock %}

{% block fetch %}
https://github.com/shadow-maint/shadow/archive/refs/tags/{{self.version().strip()}}.tar.gz
7363ef795b6cce52e4fcfbd2a0dc127be94376f82bbb72d59a059b9e3b11aab6
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/attr
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/bison
bld/gettext
{% endblock %}

{% block configure_flags %}
--disable-logind
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin/* ${out}/bin/
rm -r ${out}/sbin
{% endblock %}
