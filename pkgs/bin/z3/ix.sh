{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
z3
{% endblock %}

{% block version %}
5.3.2
{% endblock %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-{{self.version().strip()}}.tar.gz
df91b87822f5f8b6710af1f2419ba98758cd647dee3a8f0d070f128b47024dbe
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gmp/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
Z3_USE_LIB_GMP=ON
WARNINGS_AS_ERRORS=OFF
Z3_BUILD_LIBZ3_SHARED=OFF
{% endblock %}
