{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/8.tar.gz
{% endblock %}

{% block go_sha %}
42f0ef532a58d6e0459386afb4b1c7b653b29a60c11a19ccc308e014bbaa87ac
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
