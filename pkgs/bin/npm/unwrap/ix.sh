{% extends '//die/proxy.sh' %}

{% block bld_data %}
bin/npm/source
{% endblock %}

{% block bld_tool %}
bld/pzd
{% endblock %}

{% block install %}
mkdir -p ${out}/bin/bin_npm
cd ${out}/bin/bin_npm
des ${src} .
cd ..
ln -s bin_npm/bin/npm-cli.js npm
{% endblock %}
