{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/piqoni/cast-text/archive/refs/tags/v0.1.1.tar.gz
{% endblock %}

{% block go_sha %}
c9d0b04760d7a5fa1e6b222a7bb7a461f75c6c5886a50190f95552412a03ef5a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp cast-text ${out}/bin/
{% endblock %}


