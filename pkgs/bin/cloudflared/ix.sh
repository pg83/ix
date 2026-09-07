{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/cloudflared
{% endblock %}

{% block go_url %}
https://github.com/cloudflare/cloudflared/archive/refs/tags/2026.8.3.tar.gz
{% endblock %}

{% block go_sha %}
0a62ee03b6a580a3c16e386d69c03becd392cd301b370a6c67d7ab6bb014ffa5
{% endblock %}

{% block go_bins %}
cloudflared
{% endblock %}
