{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libpcap
{% endblock %}

{% block version %}
1.11.1
{% endblock %}

{% block fetch %}
https://www.tcpdump.org/release/libpcap-{{self.version().strip()}}.tar.gz
7985b1d20ff82c1e384115038046e0b15034648c6f45c92e08601d4ee1b369ed
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
