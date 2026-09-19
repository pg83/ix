{% extends '//die/c/make.sh' %}

{% block pkg_name %}
LMDB
{% endblock %}

{% block version %}
1.0.2
{% endblock %}

{% block fetch %}
https://git.openldap.org/openldap/openldap/-/archive/LMDB_{{self.version().strip()}}/openldap-LMDB_{{self.version().strip()}}.tar.bz2
f35a2eb3a8e51650397604bbb49a1295221cd4739ff787d324f6c442c138a3ee
{% endblock %}

{% block unpack %}
{{super()}}
cd libraries/liblmdb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=${CC}
{% endblock %}
