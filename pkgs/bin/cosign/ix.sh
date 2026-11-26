{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cosign
{% endblock %}

{% block version %}
3.1.6
{% endblock %}

{% block go_url %}
https://github.com/sigstore/cosign/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a9327c090b0f90f7839ee3a3623f11c94b8032b5ed05432f2995a3bc6f8e7566
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
