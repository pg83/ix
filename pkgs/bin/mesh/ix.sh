{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/17.tar.gz
{% endblock %}

{% block go_sha %}
f55a0d14e836f8f5080fb50f8474e451326292c88933af8512f30674d563161d
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
