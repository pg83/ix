{% extends '//die/c/cmake.sh' %}

{% block version %}
5.3.1
{% endblock %}

{% block pkg_name %}
upx
{% endblock %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v{{self.version().strip()}}/upx-{{self.version().strip()}}-src.tar.xz
ece4a0cbbe9b6584de2e39d0d887b3ecdfd1648d5ad8e20266485a76de09c28a
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
