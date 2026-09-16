{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/32.tar.gz
{% endblock %}

{% block go_sha %}
f18110cc5076f35ab99dd212b5bba288d81eba71962a2a61ef80a8c6ed1e49a2
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
