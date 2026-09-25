{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/17.tar.gz
{% endblock %}

{% block go_sha %}
5ca18e3ab3024e08923a123cc8036d96cc070e56f53a888e3c0478c9c8ecd4f0
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
