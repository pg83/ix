{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/26.tar.gz
{% endblock %}

{% block go_sha %}
c142b1f28348eec2beafb46420cae2a01395e397af23c43e79905144b21ad041
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
