{% extends '//lib/xxhash/t/ix.sh' %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
lib/shim/alloc
lib/compiler_rt/builtins
{% endblock %}

{% block build %}
>libxxhash.so.0
>libxxhash.so.{{self.version().strip()}}
{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
