{% extends '//lib/xxhash/t/ix.sh' %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/shim/alloc
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc
bld/rename/dynlib
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
