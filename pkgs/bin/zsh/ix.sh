{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
zsh
{% endblock %}

{% block version %}
5.9
{% endblock %}

{% block fetch %}
https://www.zsh.org/pub/zsh-{{self.version().strip()}}.tar.xz
9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/cap
lib/pam
{% endif %}
lib/curses
{% endblock %}

{% block configure_flags %}
--with-tcsetpgrp
{% endblock %}
