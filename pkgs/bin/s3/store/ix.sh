{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/27.tar.gz
{% endblock %}

{% block go_sha %}
b30bd553a166104dece810ce828627079183d888eb45edcc09a3e88c5efe2432
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
