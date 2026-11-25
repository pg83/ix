{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
delta
{% endblock %}

{% block version %}
0.22.0
{% endblock %}

{% block cargo_url %}
https://github.com/dandavison/delta/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4a9cfb869fd06b4b0a5d6b2fe8da4e2b79da2cafed99f4c0f2c584ae84db2681
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block bld_libs %}
lib/git/2
lib/oniguruma
{% endblock %}

{% block cargo_bins %}
delta
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
