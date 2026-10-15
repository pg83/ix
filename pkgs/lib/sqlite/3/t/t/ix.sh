{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
sqlite
{% endblock %}

{% block version %}
3.54.0
{% endblock %}

{% block sqlite_ver %}
{{self.version() | strip | field(0)}}{{self.version() | strip | field(1) | pad(3)}}{{self.version() | strip | field(2) | pad(3)}}
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2026/sqlite-autoconf-{{self.sqlite_ver().strip()}}.tar.gz
134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
