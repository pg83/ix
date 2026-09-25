{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
4c624515ba30436e39991835fde8815efc10b196d56ccaebf7fa98c4c283494d
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
