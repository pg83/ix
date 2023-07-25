{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.8.0.tar.gz
{% endblock %}

{% block go_sha %}
sha:e55e2a286999e70f0c4276bb4f8d00d6bf558f59fc521a2325366559070c0997
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
