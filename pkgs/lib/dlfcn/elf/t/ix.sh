{% extends '//die/c/pybuild.sh' %}

{% include 'ver.sh' %}

{% block std_box %}
bin/python/12(intl_ver=no)
bld/pkg/config
{{super.super()}}
{% endblock %}
