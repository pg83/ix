{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/21.tar.gz
{% endblock %}

{% block go_sha %}
e786cb4143b34dca787fbee3af1edf4eead2615c6ba2317e47eab2c43bb0397e
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
