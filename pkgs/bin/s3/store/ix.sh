{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
fa116ba0c9cd362d65992681a790d0cca848d848bf3a860a8274a284cb1f4c7e
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
