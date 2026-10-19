{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
28.2.0
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
87b93e80be97a3d410ac0625dcf04197e2dba94bdd4981443d5b933fbae62579
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
