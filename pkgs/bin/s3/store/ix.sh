{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/22.tar.gz
{% endblock %}

{% block go_sha %}
d317bfdad236a60bfbb4594a19c004cfea3bfdb5c0467c7fa5d85dd421cb41e1
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
