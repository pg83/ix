{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.162.1
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
86f268d81b898f3e144c5ecff2ad2fda2c5802e042d6195b72538fe0fa125057
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
458239ea45c1fc508d89695f180ab352f2834709a8a46929a4466f4f04399ada
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
extract0 ${src}/codex-x86_64-unknown-linux-musl.tar.gz
extract0 ${src}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
install -Dm755 codex-x86_64-unknown-linux-musl ${out}/bin/codex.exe
# code mode host is spawned by codex from its own bin dir, under this exact name
install -Dm755 codex-code-mode-host-x86_64-unknown-linux-musl ${out}/bin/codex-code-mode-host
{% endblock %}
