{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
17.0.0
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ef26804b7e3bc32798f7d275079e7d7c5f02fe407f134b7d9040cebea127841e
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o forgejo
{% endblock %}

{% block go_bins %}
forgejo
{% endblock %}
