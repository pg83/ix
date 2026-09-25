{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
f30aa10b20b16f77afff0a95e584e4039ad1b263778035185cfe35af2d3d963a
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
