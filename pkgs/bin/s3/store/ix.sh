{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/16.tar.gz
{% endblock %}

{% block go_sha %}
08d7566476d842dee2ec5b5a27c0deed1e6c15f65b033f9b8f26f495bc65421c
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
