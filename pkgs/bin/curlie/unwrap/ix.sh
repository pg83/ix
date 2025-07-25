{% extends '//die/go/build.sh' %}

{% block pkg_name %}
curlie
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block go_url %}
https://github.com/rs/curlie/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9e36af1f7f963d06b31ec743c73fb9b592e6a79f9bc29f85e4ad447b615309c5
{% endblock %}

{% block go_bins %}
curlie
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
