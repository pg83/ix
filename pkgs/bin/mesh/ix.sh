{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/9.tar.gz
{% endblock %}

{% block go_sha %}
aa25de1f0e09032dd3214d895a4d243d640f05d3e946af75b66ee02760dbeaa3
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
