{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/25.tar.gz
{% endblock %}

{% block go_sha %}
85ebe8f000804016fc67af1159d55a5e44de547eb0c62b48b54df6ae7309896f
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
