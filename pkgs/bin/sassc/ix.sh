{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sassc
{% endblock %}

{% block version %}
3.6.2
{% endblock %}

{% block fetch %}
https://github.com/sass/sassc/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:608dc9002b45a91d11ed59e352469ecc05e4f58fc1259fc9a9f5b8f0f8348a03
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sass
{% endblock %}
