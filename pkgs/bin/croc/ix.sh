{% extends '//die/go/build.sh' %}

{% block pkg_name %}
croc
{% endblock %}

{% block version %}
11.5.5
{% endblock %}

{% block go_url %}
https://github.com/schollz/croc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1657d44a029494e91a760a3183963d0df8260f71dd96b6d8f75a3279204190e1
{% endblock %}

{% block go_bins %}
croc
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
