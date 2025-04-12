{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v0.146.2.tar.gz
{% endblock %}

{% block go_sha %}
8d6fd93efe167d2d2df04e44fdbd0345b47b8dfecc0e13f3db58a568c84b80fb
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp hugo ${out}/bin/
{% endblock %}
