{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/11.tar.gz
{% endblock %}

{% block go_sha %}
da22d8c85468aed73bf24d25198f88d4563cc5213e5b4f13d2090325436e5135
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
