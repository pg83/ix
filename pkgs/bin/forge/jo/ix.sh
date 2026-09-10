{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
16.0.4
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
40b1811714edb1425ccde5d7cb5e391bdc3a0939161a8f02d170dd7b841665b4
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o forgejo
{% endblock %}

{% block go_bins %}
forgejo
{% endblock %}
