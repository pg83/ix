{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/31.tar.gz
{% endblock %}

{% block go_sha %}
cf72b7bf1d03fed89405ec6b5bc39901b7824e8ae50487afa6e0e44a097d2584
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
