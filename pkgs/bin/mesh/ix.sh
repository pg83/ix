{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/18.tar.gz
{% endblock %}

{% block go_sha %}
d70d1cd552d9d2a66dc6d455d0a24b972ef4c5fc3bba5080af6f2a403241e5a6
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
