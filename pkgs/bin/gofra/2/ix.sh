{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/445d118a2169b2e7c01da5eebe76390162eae9b2.tar.gz
e95d1ae2d268049d9445ade07b20176c9c4269b55226c1f43084890c769bcbda
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin/
{% endblock %}
