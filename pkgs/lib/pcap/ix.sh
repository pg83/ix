{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libpcap
{% endblock %}

{% block version %}
1.10.7
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-{{self.version().strip()}}.tar.gz
0b394ac90dbc0a9838ff97468e05c9c9a3e873dec2514cd58db65d859d296e31
{% endblock %}

{% block lib_deps %}
lib/c
lib/nl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Libs.private.*||' \
    -e 's|-Wl,-rpath.* ||' \
    -e 's|Requires.private.*||' \
    -i ${out}/lib/pkgconfig/libpcap.pc
{% endblock %}

{% block env %}
export COFLAGS="--with-libpcap=${out} \${COFLAGS}"
{% endblock %}
