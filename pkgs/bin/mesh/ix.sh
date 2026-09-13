{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/8.tar.gz
{% endblock %}

{% block go_sha %}
2c7df4dc3798c2f42338dd2b71792b01b64489b5db2065e28cc6e7bb0d3106c6
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
