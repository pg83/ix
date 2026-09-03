{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
solo
{% endblock %}

{% block version %}
10
{% endblock %}

{% block fetch %}
https://github.com/pg83/solo/archive/refs/tags/{{self.version().strip()}}.tar.gz
0c5a17948bcb6c5e59fa4c14ef812b2fc983636ae54b457c9adb545c947c666b
{% endblock %}

{% block std_box %}
bin/python/12(intl_ver=no)
bld/pkg/config
{{super.super()}}
{% endblock %}
