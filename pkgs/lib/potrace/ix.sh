{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
potrace
{% endblock %}

{% block version %}
1.16
{% endblock %}

{% block fetch %}
https://potrace.sourceforge.net/download/{{self.version().strip()}}/potrace-{{self.version().strip()}}.tar.gz
be8248a17dedd6ccbaab2fcc45835bb0502d062e40fbded3bc56028ce5eb7acc
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block configure_flags %}
--with-libpotrace
{% endblock %}
