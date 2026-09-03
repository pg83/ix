{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
16a424db94d16ae7bf92ef1eab0794cc6f824e065136cbb4c72d7f114cd81926
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
