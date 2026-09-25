{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/14.tar.gz
{% endblock %}

{% block go_sha %}
e293417f605f4ea82a91bbca4ec276e3b2fdd687490c750900c17dc33268c425
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
