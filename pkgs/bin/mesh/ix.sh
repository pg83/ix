{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/24.tar.gz
{% endblock %}

{% block go_sha %}
e95e741987727efff836b1688b7d627f209702e639eb5720612c2cc378f9185f
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
