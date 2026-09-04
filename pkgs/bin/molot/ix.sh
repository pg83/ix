{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/32.tar.gz
{% endblock %}

{% block go_sha %}
6df56b49b5e0b9965e1a3e09b860aa88041a6f88e2127eebc5b12769857b987a
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
