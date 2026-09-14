{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/22.tar.gz
{% endblock %}

{% block go_sha %}
961d5c889caee5ec41210c81d73567f2a24dd585ee9b92690d23f562f35411cb
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
