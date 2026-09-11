{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
8bd9a619d45ea836cd772f5448a41b719d0a7e8997cee6079ea70085e61d7bc3
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
