{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
16.0.6
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8a977c0db8e2ae8559cce6f8da174885ec087f746d27dec5df8dd46aaeb65f5f
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o forgejo
{% endblock %}

{% block go_bins %}
forgejo
{% endblock %}
