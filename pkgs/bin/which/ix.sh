{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
md5:097ff1a324ae02e0a3b0369f07a7544a
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}
