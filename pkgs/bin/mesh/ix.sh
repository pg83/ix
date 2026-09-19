{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/33.tar.gz
{% endblock %}

{% block go_sha %}
660713669a894aaa07b05a8c84bb51636921458bd2385bee766c8de46e9a80ae
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
