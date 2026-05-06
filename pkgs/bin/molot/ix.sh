{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/24.tar.gz
{% endblock %}

{% block go_sha %}
e3e294b4a58bb7e81fa1eb561426f3c93df3dc87ab51f634a82792b2fda290f6
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
