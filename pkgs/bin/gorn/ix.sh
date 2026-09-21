{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/34.tar.gz
{% endblock %}

{% block go_sha %}
d5a25b167ad82210f9d4ef56d40f0b877367785e14885d71de79afd619e5809e
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
