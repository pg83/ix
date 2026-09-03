{% extends '//lib/dlfcn/elf/t/ix.sh' %}

{% block pybuild_target %}
solo
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp solo ${out}/bin/
{% endblock %}
