{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/41.tar.gz
{% endblock %}

{% block go_sha %}
8c2e1d950d3672b18f3447a8c7806f035a088e2adef1a1613a3e1429c0e61ad0
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
