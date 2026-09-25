{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
81dfa238d5ba99d3bfb9715816ea5476d519c055c28a2e546dacfbe6e115c843
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
