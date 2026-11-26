{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tomlplusplus
{% endblock %}

{% block version %}
3.5.1
{% endblock %}

{% block fetch %}
https://github.com/marzer/tomlplusplus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4821c769370a6489b6a37814f16f3769eee0f2e733a5c129d5d99e2515a95c2b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=tomlplusplus,pkg_ver=3.4.0)
{% endblock %}
