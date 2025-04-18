{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tinyssh
{% endblock %}

{% block version %}
20250201
{% endblock %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:7eddb7ef4b4853cbba63d0834b2b347f01a2fb980fc50aa6c13a35c387930bfc
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
