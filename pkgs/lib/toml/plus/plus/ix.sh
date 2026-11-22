{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tomlplusplus
{% endblock %}

{% block version %}
3.5.0
{% endblock %}

{% block fetch %}
https://github.com/marzer/tomlplusplus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
97ebfe14382ebbae3350d06d785ba71b40f0ed1d3501bfad423b1cce0aee25a9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=tomlplusplus,pkg_ver=3.4.0)
{% endblock %}
