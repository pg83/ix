{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
98e869605efa698b72c0380952e6b4cf2656ca84bb537133675da5363fb55232
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
