{% extends '//die/go/build.sh' %}

{% block pkg_name %}
croc
{% endblock %}

{% block version %}
11.6.7
{% endblock %}

{% block go_url %}
https://github.com/schollz/croc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
98bf790553cefb2d095c6df9c0aad30b28f82e192dd8b5997615fcc74b028ccb
{% endblock %}

{% block go_bins %}
croc
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
