{% extends '//lib/xxhash/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc
bld/rename/dynlib
{% endblock %}

{% block build_flags %}
wrap_cc
{{super()}}
wrap_rdynamic
{% endblock %}
