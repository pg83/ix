{% extends '//mix/template/proxy.sh' %}

{% block bld_tool %}
lib/xz/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v xz)) ./
{% endblock %}
