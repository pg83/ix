{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gomuks
{% endblock %}

{% block version %}
26.09
{% endblock %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v0.{{self.version().strip().replace('.', '')}}.0.tar.gz
{% endblock %}

{% block go_sha %}
3e64cbacb8a78d2e71d66a60967473d622afb642449f5c983122b39a9919ab37
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block unpack %}
{{super()}}
mkdir -p web/dist
touch web/dist/empty
cd cmd/gomuks
{% endblock %}

{% block go_tags %}
sqlite_fts5
{% endblock %}

{% block go_bins %}
gomuks
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
