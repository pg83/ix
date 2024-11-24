{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://skarnet.org/software/nsss/nsss-0.2.0.5.tar.gz
sha:954c1b25791cc36d07c3e123ec03436d3e296bf5233f1d08bc016d6d7e6279d2
{% endblock %}

{% block lib_deps %}
lib/skalibs
{% endblock %}

{% block bld_libs %}
lib/c++
lib/kernel
{% endblock %}

{% block configure_flags %}
--with-nsssd-socket=/var/run/nsssd/nsssd.sock
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem ${out}/include/nsss \${CPPFLAGS}"
{% endblock %}
