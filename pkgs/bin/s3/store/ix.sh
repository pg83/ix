{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
220f44922a14f33dcffcca357fe27473f2afef85f83c3d43ea3307fb75130f64
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
