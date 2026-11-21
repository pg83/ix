{% extends '//die/go/build.sh' %}

{% block pkg_name %}
landrun
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block go_url %}
https://github.com/Zouuup/landrun/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e48c28f06f4fb4e7981e54db77c63f52837556fe816181f07e03e6ac19681c31
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/landrun
{% endblock %}

{% block go_bins %}
landrun
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
