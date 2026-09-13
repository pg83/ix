{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/13.tar.gz
{% endblock %}

{% block go_sha %}
58ef69ef02701629e3bd328991fd56640029c6cdf8aa85f9699a1a62aa0acf7a
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
