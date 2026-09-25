{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
964e140968af64cd247f18625ff1aae3a5e5296a70c4879f13bded19f32782b1
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
