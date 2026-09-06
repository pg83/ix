{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tokei
{% endblock %}

{% block version %}
15.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/XAMPPRocky/tokei/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
75728164c7eaf7b4b807e4e2832b04e5fe0269e2d494caeb0e7b1a63476358fc
{% endblock %}

{% block cargo_bins %}
tokei
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
