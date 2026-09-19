{% extends '//die/c/autorehell.sh' %}

# check bin/nfs/utils
# check bin/ip/route2

{% block pkg_name %}
libtirpc
{% endblock %}

{% block version %}
1.3.8
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-{{self.version().strip()}}.tar.bz2
8839959bfcc7a0f4c609d8e4f53f1c67ae33de23775ec35beb39ff15adf11920
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
--disable-gssapi
--enable-rpcdb
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/tirpc \${CPPFLAGS}"
{% endblock %}
