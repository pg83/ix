{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/10.tar.gz
{% endblock %}

{% block go_sha %}
f104c681277772bd3e4c0a14df8a29da01f709b395181851df81408993d81dd4
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
