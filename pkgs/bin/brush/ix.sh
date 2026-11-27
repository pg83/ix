{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
brush
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/reubeno/brush/archive/refs/tags/brush-shell-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
ac4c38753571c4ac595a5b3a93a74feb4430335c3fc6238f0f45f00fea386b28
{% endblock %}

{% block cargo_bins %}
brush
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
