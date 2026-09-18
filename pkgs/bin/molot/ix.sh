{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/37.tar.gz
{% endblock %}

{% block go_sha %}
c4512f639c6902afb0d034db9e733d56c3090c713e5bf3cabfc0abda7c115965
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
