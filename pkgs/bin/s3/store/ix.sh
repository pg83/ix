{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
083f2168537f0123552196eea0cb57302fb748a09ec45df4f30e7c61bafa6515
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
