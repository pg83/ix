{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/logovo/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
a738c189268928fcbeddb6d1c21074e880dd4016addc096e973667fdd741d786
{% endblock %}

{% block go_bins %}
logovo
{% endblock %}
