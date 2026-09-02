{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
codex
{% endblock %}

{% block version %}
0.152.1
{% endblock %}

{% block fetch %}
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-x86_64-unknown-linux-musl.tar.gz
a0ed1b40b1d597b340f09ae00ecebc46670b06cb52aac315b9dc84fed0289fd0
https://github.com/openai/codex/releases/download/rust-v{{self.version().strip()}}/codex-code-mode-host-x86_64-unknown-linux-musl.tar.gz
0146adfaac8363ec9fcdb5895f7624db5b2e8617a283887938b7fb97a1dd4356
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
