{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cosign
{% endblock %}

{% block version %}
3.1.5
{% endblock %}

{% block go_url %}
https://github.com/sigstore/cosign/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d91f5e9bb073f71aefee910900f880b7c9caf2440b7eef840852ad9d7e13a591
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/cosign
{% endblock %}

{% block go_bins %}
cosign
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
