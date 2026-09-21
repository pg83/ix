{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/33.tar.gz
{% endblock %}

{% block go_sha %}
b7fd6f100e5de91ac9bd45d39fbb920bbeab81c40856cf5c380ed12f3bb2b774
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
