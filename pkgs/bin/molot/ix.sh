{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/33.tar.gz
{% endblock %}

{% block go_sha %}
cfa83717aa60392381e548edb3f2f7a970422552e388eade72dc0754ae14cd3b
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
