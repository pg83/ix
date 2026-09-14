{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/23.tar.gz
{% endblock %}

{% block go_sha %}
01e811f27c8f9b8d20744a7d69fdde3152d61cadcd9b66f73de758c135029c23
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
