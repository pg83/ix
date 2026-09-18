{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/38.tar.gz
{% endblock %}

{% block go_sha %}
2c8c59a13ced15e3cbfb084d5d75328f9b6b4cfe60fe1dc33eac5c23e19038c6
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
