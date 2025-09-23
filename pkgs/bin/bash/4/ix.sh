{% extends '//bin/bash/5/ix.sh' %}

{% block pkg_name %}
bash
{% endblock %}

{% block version %}
4.4.18
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-{{self.version().strip()}}.tar.gz
604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23
{% endblock %}

{#parse.y:5741:21: error: call to undeclared function 'count_all_jobs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]#}

{% block c_flags %}
-Wno-implicit-function-declaration
{{super()}}
{% endblock %}
