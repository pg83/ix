{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/9.tar.gz
{% endblock %}

{% block go_sha %}
5b2b0a55ad967901d3614079f43754b7822d9cbc5c237b47d6588a78bcb4e46a
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}

{% block step_setup %}
{{super()}}
export CGO_ENABLED=0
export GO_EXTLINK_ENABLED=0
{% endblock %}
