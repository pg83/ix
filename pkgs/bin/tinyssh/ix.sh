{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tinyssh
{% endblock %}

{% block version %}
20260906
{% endblock %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/{{self.version().strip()}}.tar.gz
54c143281e3a7430e9db80847c3242bbd6bf859ceafb5a18562bc4ecbbb2806d
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
