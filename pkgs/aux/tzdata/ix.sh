{% extends '//die/c/make.sh' %}

{% block version %}
2026d
{% endblock %}

{% block pkg_name %}
tzdb
{% endblock %}

{% block fetch %}
https://data.iana.org/time-zones/releases/tzdb-{{self.version().strip()}}.tar.lz
aab9e59f7b2530b0f98079f7c8645f2cdf59a2cd8992ca0ddfbbec0ec83b65de
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
USRDIR=
DESTDIR=${out}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -r etc sbin
mkdir etc
ln -s ${out}/share/zoneinfo etc/
{% endblock %}
