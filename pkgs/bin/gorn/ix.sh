{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/32.tar.gz
{% endblock %}

{% block go_sha %}
6c5fe7531f7f1e4b01416ffcd751e7a84c70ae62b3d6519d02f4f043a2b4d046
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
