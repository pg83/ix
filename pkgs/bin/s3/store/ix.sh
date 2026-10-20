{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/34.tar.gz
{% endblock %}

{% block go_sha %}
424a9fd00495020e65347247c31b6383f003fc6b683d5cdb0c4ec8c26d41480c
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
