{% extends '//die/go/build.sh' %}

{% block pkg_name %}
logalize
{% endblock %}

{% block version %}
0.8.2
{% endblock %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2ee99a3ca950ee7eeb38c49aa40bcfe93f3c6cc4d1556dd3beaab523fc67292e
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_bins %}
logalize
{% endblock %}
