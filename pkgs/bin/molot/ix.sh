{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/36.tar.gz
{% endblock %}

{% block go_sha %}
5c2b297fa42d01abf24e808778ffc967ea206442ba94c6531619c5e9e79d6310
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
