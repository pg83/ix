{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/20.tar.gz
{% endblock %}

{% block go_sha %}
2a5165fe87051e3ce9d8def558fb0c11a0d7d9fc408df68b3a1105d45ab3a508
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
