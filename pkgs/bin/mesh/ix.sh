{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/25.tar.gz
{% endblock %}

{% block go_sha %}
2d50d27b34ce4b5f775dc2b6092e6be167cd41e75e67b6760d6d6a9eb66c4a86
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
