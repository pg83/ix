{% extends '//lib/clc/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/23/ver.sh' %}
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/llvm/23
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/llvm/spirv/21
{% endblock %}
