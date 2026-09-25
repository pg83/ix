{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/13.tar.gz
{% endblock %}

{% block go_sha %}
0cdc70cb6bdcd21fe41e70150307aab16fb3dafb439516dc9412945eed051e24
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
