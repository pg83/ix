{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
7d6e84ee7ff00ec7940f711435f03c32313d4386c70b96228daf16ba0b6bf022
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
