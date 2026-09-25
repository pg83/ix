{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/8.tar.gz
{% endblock %}

{% block go_sha %}
1ea84627e57bf200490192a27ef5802a54a2b733ea8b7bd8365efdf60897a6fe
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
