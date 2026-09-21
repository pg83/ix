{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/36.tar.gz
{% endblock %}

{% block go_sha %}
4375a86f638ed37a10487e5a69f0d4f1d5290c7b4847ed7ac8496b635d44a7ab
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
