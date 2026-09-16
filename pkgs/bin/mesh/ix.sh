{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/31.tar.gz
{% endblock %}

{% block go_sha %}
ac62c307087ae4f763da93575e4f01fd61481aa3b2dd895e5234e0abba0b6ecc
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
