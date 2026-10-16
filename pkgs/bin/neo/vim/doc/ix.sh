{% extends '//die/c/make.sh' %}

# check bin/neo/vim

{% block pkg_name %}
tree-sitter-vimdoc
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/neovim/tree-sitter-vimdoc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
141834849055dc447cac35b0f7fb53c265f8b93f6003cfbd6394cdafa946e432
{% endblock %}

{% block bld_libs %}
lib/tree/sitter
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
