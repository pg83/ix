{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
yyjson
{% endblock %}

{% block version %}
0.13.0
{% endblock %}

{% block fetch %}
https://github.com/ibireme/yyjson/archive/refs/tags/{{self.version().strip()}}.tar.gz
34e0f62a2bc11ab20d601e8ca1cc2b2079503aa45119a19133d89d19b94a0fae
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
