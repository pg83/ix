{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ripgrep
{% endblock %}

{% block version %}
16.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/BurntSushi/ripgrep/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2dea7b85d63ba26e5a4dcdded23b1f746b6086b58cf25cb5817b733885a08311
{% endblock %}

{% block patch %}
sed -i '/\[target.*jemallocator\]/,/^$/d' Cargo.toml
sed -i '/jemallocator/d' Cargo.toml
sed -i '/#\[global_allocator\]/,/static ALLOC/d' crates/core/main.rs
sed -i '/jemallocator/d' crates/core/main.rs
{% endblock %}

{% block cargo_bins %}
rg
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
