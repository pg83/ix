{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/12.tar.gz
{% endblock %}

{% block go_sha %}
d5b96c0d3075cb7fa75b30edfcf578ae6e4b74666892af5e914991e8a8b6abd9
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
