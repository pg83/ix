{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/63b1b0b705ca993e35edc3f4fed641aacf4761a4.tar.gz
{% endblock %}

{% block go_sha %}
a07346b912bee99542130ea26f1bfecef0e2769408c1fcb697c3ef1d8efdae24
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
