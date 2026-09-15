{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/29.tar.gz
{% endblock %}

{% block go_sha %}
ea1316a14f635c45e3c43b5c0c292e0389dcecabe74f7588df9ddb0b242e1659
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
