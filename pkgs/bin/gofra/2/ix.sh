{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/987e4059af8c6e94f22401c0cc2080cbb89b9afc.tar.gz
7818df846e323d2582babd119705ce31b5fe1ce5f9e4029a33612b9e87db8b24
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
