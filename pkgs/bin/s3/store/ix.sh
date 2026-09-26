{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/26.tar.gz
{% endblock %}

{% block go_sha %}
70d33ab093fbb285c5956e4bfc7cde205c793099a11622ef6fffcae596bc8378
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
