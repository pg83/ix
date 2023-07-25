{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v2.14.4.tar.gz
{% endblock %}

{% block go_sha %}
sha:88d42e17afca91ea16c5657dcd6b4779e091e841956eb9be9b7c7f29e8490267
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}
