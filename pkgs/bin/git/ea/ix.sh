{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
28.1.0
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a4a2044a9c784bba5243130f5b72b70de64ce3aec8332754aa1d1837fa3133a3
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o gitea
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}
