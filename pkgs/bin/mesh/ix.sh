{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/28.tar.gz
{% endblock %}

{% block go_sha %}
7ba7c587afbcda37a80d29033a1e2e3504cd2bb74072c1ea1e1cd8c55dad3819
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
