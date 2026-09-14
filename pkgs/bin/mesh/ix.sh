{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/19.tar.gz
{% endblock %}

{% block go_sha %}
60fbde6bd200aef81e6cefa5e84158a4cb5b58dfe9e9c765a14c257a86d3ae17
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
