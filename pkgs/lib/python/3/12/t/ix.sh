{% extends '//lib/python/3/11/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.12.15
{% endblock %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c1512aa5fc62be59b733636ecf643085ac3634900cc178fb593b3b934e9b8ca3
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block cpp_includes %}
{{super()}}
${PWD}/Modules/_hacl/include
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
wrap_rdynamic_fake
{% endblock %}
