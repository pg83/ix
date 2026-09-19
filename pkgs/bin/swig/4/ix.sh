{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
swig
{% endblock %}

{% block version %}
4.5.1
{% endblock %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-{{self.version().strip()}}.tar.gz
7fec50b27deddab5455a9633780b6341eddfb96215a7619e93a76eb27178f653
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pcre/2
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block configure_flags %}
--with-boost=no
{% endblock %}
