{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.132.0
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
8b64432ee4ef5b1d7d197aad4535a276bc85223f4e4163769c0e1015cda883b2
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
extract0 ${src}/codex-x86_64-unknown-linux-musl.tar.gz
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 codex-x86_64-unknown-linux-musl ${out}/bin/codex.exe
{% endblock %}
