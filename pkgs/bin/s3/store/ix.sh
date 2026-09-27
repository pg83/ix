{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/28.tar.gz
{% endblock %}

{% block go_sha %}
ca6382fe06308508a18830d59714c2ab8ad43d7736fb5c37c50f8770e150ce5f
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
