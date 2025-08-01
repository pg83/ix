{% extends '//lib/git/2/ix.sh' %}

{% block pkg_name %}
libgit2
{% endblock %}

{% block version %}
1.0.1
{% endblock %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1775427a6098f441ddbaa5bd4e9b8a043c7401e450ed761e69a415530fea81d2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ssh/2
lib/pcre/2
lib/openssl
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/python
{% endblock %}
