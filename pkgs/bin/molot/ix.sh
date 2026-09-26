{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/43.tar.gz
{% endblock %}

{% block go_sha %}
05b774fd2e15f1ce51dec524d3e89aa5d8bf5bcfa307e365b25dc2733156d900
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
