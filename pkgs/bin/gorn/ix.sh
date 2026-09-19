{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/32.tar.gz
{% endblock %}

{% block go_sha %}
48d8f4772b0253532010a8687c747dbbeb22846f98e1692c5affd0bdd87d3b60
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
