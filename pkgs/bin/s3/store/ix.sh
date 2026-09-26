{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/s3/archive/refs/tags/21.tar.gz
{% endblock %}

{% block go_sha %}
28c237789b4516a233a522b3238dddc4e6f361809bee6376f0086f2f04ffe5bf
{% endblock %}

{% block go_bins %}
s3
{% endblock %}
