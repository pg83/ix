{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/18.tar.gz
{% endblock %}

{% block go_sha %}
851e57a832f2892b39a6dd0dc831bf4a909ecf4abe4b086896a0922e1e148455
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
