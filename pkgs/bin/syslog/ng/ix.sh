{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
syslog-ng
{% endblock %}

{% block version %}
4.9.0
{% endblock %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-{{self.version().strip()}}/syslog-ng-{{self.version().strip()}}.tar.gz
6959545cb9aaa694e4514f472c69d6e5a908abb5161861a0082c917cdf7184e2
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/glib
lib/pcre
lib/curl
lib/json/c
lib/hiredis
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/tar
bld/flex
bld/bison
bld/python
bld/auto/archive
{% endblock %}

{% block autoreconf %}
(
cd lib/ivykis
libtoolize -ci
autoreconf -if
)
{{super()}}
{% endblock %}

{% block cxx_flags %}
-std=c++20
{% endblock %}

{% block patch %}
>modules/examples/sources/random-choice-generator/random-choice-generator.cpp
{% endblock %}
