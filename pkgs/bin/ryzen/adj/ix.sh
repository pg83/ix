{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
RyzenAdj
{% endblock %}

{% block version %}
0.16.0
{% endblock %}

{% block fetch %}
https://github.com/FlyGoat/RyzenAdj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7bef7dbde006afbe316091d8da8c8c551d5d7d43185d9e62281671959b7a3ca2
{% endblock %}

{% block bld_libs %}
lib/c
lib/pci/utils
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/ryzenadj ${out}/bin/
{% endblock %}
