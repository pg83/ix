{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/logovo/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
2f1122382946b72fe98ffd3438310309064d5677c8f7df91d7cd42f8872992bd
{% endblock %}

{% block go_bins %}
logovo
{% endblock %}
