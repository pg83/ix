{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
7c81350d0834acb517d22701e9835d69a77d5b29f317530a81ed4e998e568fb5
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
