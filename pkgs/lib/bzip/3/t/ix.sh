{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bzip3
{% endblock %}

{% block version %}
1.5.4
{% endblock %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/{{self.version().strip()}}.tar.gz
c4ff6bfe4a8a9fed987a9de4d6a6f4025a991acec9559fae4853a9d99ca8d76a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
