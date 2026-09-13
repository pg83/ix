{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/12.tar.gz
{% endblock %}

{% block go_sha %}
364740aa2004be61f1fd5a361a019be327cac8b640deb06f5d345411168c401a
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
