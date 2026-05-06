{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/23.tar.gz
{% endblock %}

{% block go_sha %}
ae5b16c3b3715f4e340ceb358185a019903c2e36bcf7323b6c262a8aab9e8a08
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
