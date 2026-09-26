{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/20.tar.gz
{% endblock %}

{% block go_sha %}
a5b64cc5be429adbb9a1df99f2795aa5c375c7240b3fe58f3022c0a424b6bb5d
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
