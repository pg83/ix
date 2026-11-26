{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
screen
{% endblock %}

{% block version %}
5.0.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/screen/screen-{{self.version().strip()}}.tar.gz
941c98ffecdca4bff4bbd1cd6f08fbd18967353affc46521040a999dafbd39a2
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/pam
lib/bsd/overlay
{% endif %}
lib/curses
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block c_flags %}
{# no select - no screen! #}
-Wno-implicit-function-declaration
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--enable-pam
--enable-colors256
{% endblock %}
