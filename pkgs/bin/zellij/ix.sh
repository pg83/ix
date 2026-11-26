{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zellij
{% endblock %}

{% block version %}
0.46.1
{% endblock %}

{% block cargo_url %}
https://github.com/zellij-org/zellij/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
72f33122780177e44ce8c3947de53daefef598e431cf6aefea469ab821968f4b
{% endblock %}

{% block bld_libs %}
lib/curl
lib/openssl
{% endblock %}

{% block cargo_bins %}
zellij
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
