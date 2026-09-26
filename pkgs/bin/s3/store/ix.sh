{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/23.tar.gz
{% endblock %}

{% block go_sha %}
8335da1e7bfdea6c9a6f0da4a5bf0c69a8ecf8c58198b5305f354a07ba6bc205
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
