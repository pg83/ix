{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.197
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
f54e69cbc89b2da61a415700af7ff52a147e862517d4f1b0eecf768448cf7f83
{% endblock %}

{% block bld_tool %}
bin/patch/elf
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 ${src}/claude ${out}/bin/claude.exe
{% endblock %}

{% block postinstall %}
:
{% endblock %}
