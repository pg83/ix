{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/19.tar.gz
{% endblock %}

{% block go_sha %}
45df54cfd16690f9e32b072f8574234c7c02ef0f53b1f55f2a4669562c19ac9a
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
