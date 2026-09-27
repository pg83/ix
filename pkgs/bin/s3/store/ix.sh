{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/30.tar.gz
{% endblock %}

{% block go_sha %}
54fc7c69d2ca6db4fab1580e37670e15a6081fd3bb9cb1eba30ca44209f41d7f
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
