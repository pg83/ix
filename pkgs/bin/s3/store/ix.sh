{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/33.tar.gz
{% endblock %}

{% block go_sha %}
8d30fcd1b83ae365d55ef72c81290841dcbdb9953a7a4744f776dfbdd7b51f42
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
