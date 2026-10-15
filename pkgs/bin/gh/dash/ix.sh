{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gh-dash
{% endblock %}

{% block version %}
4.26.0
{% endblock %}

{% block go_url %}
https://github.com/dlvhdr/gh-dash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1a19840bb450a08c0baaad1fcd0a2d335b1b49f74ae5c63859add50e9cdb6c86
{% endblock %}

{% block go_bins %}
gh-dash
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
