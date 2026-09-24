{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/logovo/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
88bb1deb0932e373c92a8b14e9016906bab916c7a88f418a9881d20b863bfe73
{% endblock %}

{% block go_bins %}
logovo
{% endblock %}
