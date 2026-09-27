{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/31.tar.gz
{% endblock %}

{% block go_sha %}
7bc4e44496c130ba8b53f337b9aa0260eb1b79d4ea533e666e90047cc07d89d2
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
