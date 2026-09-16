{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/30.tar.gz
{% endblock %}

{% block go_sha %}
00afc4d65bd9fe359aab89bd674ae019f6b8ca5e689a7124837c24b9f3fd4633
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
