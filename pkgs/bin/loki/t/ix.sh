{% extends '//die/go/build.sh' %}

{% block pkg_name %}
loki
{% endblock %}

{% block version %}
3.7.8
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_url %}
https://github.com/grafana/loki/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5a52394307c18867376ef629f190007646c0af4e9ef0e6ef3b9866b58fb630ac
{% endblock %}
