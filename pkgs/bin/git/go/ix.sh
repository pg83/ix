{% extends '//die/go/build.sh' %}

{% block pkg_name %}
go-git
{% endblock %}

{% block version %}
5.19.2
{% endblock %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e942426ed11fb857a766134dc3262b013c29efc963c59d8214009ca9a945db36
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block go_bins %}
go-git
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
