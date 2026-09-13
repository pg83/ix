{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
c3fba8a7b508353536fdae34e1bbe338c8fffc878ca2cc4bb1fb1a2a7d6bfafd
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
