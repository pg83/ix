{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libyaml
{% endblock %}

{% block version %}
0.2.7
{% endblock %}

{% block fetch %}
https://github.com/yaml/libyaml/archive/refs/tags/{{self.version().strip()}}.tar.gz
7f76964485c67dc4e1537fdfd4ad5c8772bcef501c5451b617e43f831034994e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
