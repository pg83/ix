{% extends '//die/go/build.sh' %}

{% block pkg_name %}
git-lfs
{% endblock %}

{% block version %}
3.8.0
{% endblock %}

{% block go_url %}
https://github.com/git-lfs/git-lfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
07c2dd96145e3ede3df6ef0273d9978ce10d764b8eb3fd940194f6ce62d585cd
{% endblock %}

{% block go_bins %}
git-lfs
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
