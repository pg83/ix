{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/24.tar.gz
{% endblock %}

{% block go_sha %}
22a6654f58dacf459d1a2ac48d1bfcd15116e4949043c3ab76f617a2d340062f
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
