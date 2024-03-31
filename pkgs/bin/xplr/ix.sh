{% extends '//die/rust/cargo.sh' %}

{# hard luajit vendor #}

{% block cargo_url %}
https://github.com/sayanarijit/xplr/archive/refs/tags/v0.21.5.tar.gz
{% endblock %}

{% block cargo_sha %}
aaef65b91d0fdd616fd373d370164fac68a17f259b5489958586e1e72756b888
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block patch %}
{{super()}}
cat .cargo/config
rm .cargo/config
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}
