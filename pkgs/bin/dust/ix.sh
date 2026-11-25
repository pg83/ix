{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
du-dust
{% endblock %}

{% block version %}
1.2.8
{% endblock %}

{% block cargo_url %}
https://github.com/bootandy/dust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
26adbffbfb15f66bb67b6dbc5f6fef7505719bf9bcaed97e94de5f06b14b7645
{% endblock %}

{% block cargo_bins %}
dust
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
