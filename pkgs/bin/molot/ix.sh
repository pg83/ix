{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/35.tar.gz
{% endblock %}

{% block go_sha %}
e746af4a73e43773ddb8038e3fa9ed31c7ad0565b607f3f83eb3f67f53745c6e
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
