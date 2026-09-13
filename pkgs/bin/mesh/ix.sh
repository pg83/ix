{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/10.tar.gz
{% endblock %}

{% block go_sha %}
39a61d0813387548a815e6974c289e6877c7c9f93e4910297ab6f223ea669763
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
