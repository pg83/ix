{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/40.tar.gz
{% endblock %}

{% block go_sha %}
5558c10102cb9b07a75e41a9863ec4a0aed7f6ad19c11d0cee8f55ca17ee52dc
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
