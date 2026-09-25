{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/11.tar.gz
{% endblock %}

{% block go_sha %}
d400dd247ef21560d9563a226340aafee60a569d80fc4653c56362a2f84bd075
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
