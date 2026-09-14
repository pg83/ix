{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/14.tar.gz
{% endblock %}

{% block go_sha %}
aa81477b9ac673a1af997ee359b964ce8d343fe5d95e9bec41bd58cd820ab07b
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
