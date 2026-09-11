{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
20142605a376d42b0401149b8c616caf4380a9bb788bbb20bc4260a93df6d87f
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
