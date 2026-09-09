{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/30.tar.gz
{% endblock %}

{% block go_sha %}
4387ddef16afa8ec7ca0a2ede41f5032445a7d0f76df381fc4094f110262fe03
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
