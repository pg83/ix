{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/15.tar.gz
{% endblock %}

{% block go_sha %}
41c372a0a476773d503e3c148bf456622bb8a5c99dd0c73b608a7f78671d0405
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
