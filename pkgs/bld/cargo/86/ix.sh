{% extends '//bld/cargo/80/ix.sh' %}

{% block version %}
0.86.0
{% endblock %}

{% block cargo_sha %}
0da865cefeff0eca7c49df206a16216bed678de924fa0b515ad5901656c8f557
{% endblock %}

{% block bld_libs %}
lib/curl
lib/git/2
lib/openssl
{% endblock %}
