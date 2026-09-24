{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/logovo/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
b77c493e76cd4018a22c917829c68e736cdda1e35b8e7821266d9ec020f46cac
{% endblock %}

{% block go_bins %}
logovo
{% endblock %}
