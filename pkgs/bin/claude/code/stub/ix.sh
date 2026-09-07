{% extends '//die/inline/program.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
stub.c
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE
{% endblock %}

{% block ld_flags %}
{% if x86_64 %}
-Wl,--image-base=0x40000000
{% else %}
${SOLO_MUSL_TLS_OBJECT}
{% endif %}
{% endblock %}

{% block setup_target %}
{{super()}}
{% if x86_64 %}
export LDFLAGS="${LDFLAGS} ${SOLO_MUSL_TLS_OBJECT}"
{% endif %}
{% endblock %}

{% block name %}
claude-solo-stub
{% endblock %}

{% block env %}
export CLAUDE_SOLO_STUB="${out}/bin/{{self.name().strip()}}"
{% endblock %}
