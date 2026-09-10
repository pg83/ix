{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/31.tar.gz
{% endblock %}

{% block go_sha %}
737e94b1ac2b9886669574bd1552f556fa00cdae9f43e79e8f780d376f95c389
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
