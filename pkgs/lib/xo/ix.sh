{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxo
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/{{self.version().strip()}}.tar.gz
ae2c61d4c6517cf7feada02fa91a5460a8d99eafddf5be4cb1352cd507b9450b
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block autoreconf %}
sh bin/setup.sh
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|.*sys/sysctl.h.*||' -i ${l}
done
sed -e 's|AC_MSG_FAILURE("could not find msgfmt tool")|AC_MSG_NOTICE("could not find msgfmt tool")|' -i configure.ac
{% endblock %}
