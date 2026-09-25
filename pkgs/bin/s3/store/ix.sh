{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/9.tar.gz
{% endblock %}

{% block go_sha %}
1f3876a4e1278ec459290717c7f35414f2fd807a9f2089cf58e76b15d2a95914
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
