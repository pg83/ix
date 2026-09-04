{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/34.tar.gz
{% endblock %}

{% block go_sha %}
ccd3bf3d9b6932050b6138d59ab5c18149fa2ebdd8e28e7b47c18eadc301e9da
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
