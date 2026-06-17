{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.176
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
075bc326c19a5484c86f3ea8633cf4bf7e26ed72bf3529bc8b64a00db1c488cc
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
