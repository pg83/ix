{% extends '//bld/boot/8/lib/compiler_rt/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/4/env
{% endblock %}

{% block patch %}
{{super()}}
rm lib/builtins/gcc_personality_v0*
{% endblock %}
