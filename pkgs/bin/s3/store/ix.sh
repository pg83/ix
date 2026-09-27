{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/29.tar.gz
{% endblock %}

{% block go_sha %}
7c8f11d933ab004568310f7440d9ff792c4c0012cbafd57e16e6adc6bd7b7dd0
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
