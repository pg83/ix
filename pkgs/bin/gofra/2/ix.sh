{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/2bd403b471fa12835caa0be2af9e37438e346ac2.tar.gz
ad9ae0540ff53d6628f2319dc7d3cde61a1714bde561121e2a1adf79a03236b9
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block make_target %}
gofra
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin/
{% endblock %}
