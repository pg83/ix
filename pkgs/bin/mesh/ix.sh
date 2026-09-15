{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/27.tar.gz
{% endblock %}

{% block go_sha %}
32c6476f72e0e152ac348ce7fd19569d8cdd8794a7cc63b7724ea027a6820263
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
