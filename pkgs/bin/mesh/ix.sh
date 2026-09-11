{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/mesh/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
7ed7d16116b5dd99bebd6140787c339ffc507feeb52a762fd269a3bcf71cad4a
{% endblock %}

{% block go_bins %}
mesh
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
