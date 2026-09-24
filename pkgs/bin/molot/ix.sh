{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/42.tar.gz
{% endblock %}

{% block go_sha %}
e08c988c882251feb8f55eb3d03d0809d3bbcbc37c464b941131317db1361f25
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
