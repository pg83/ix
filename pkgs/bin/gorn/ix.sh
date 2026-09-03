{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/28.tar.gz
{% endblock %}

{% block go_sha %}
89eb72411d30e59b5b44c781a4767dc797e2544c7e7ad169a53aafd8cfaca59c
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
