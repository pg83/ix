{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ls-qpack
{% endblock %}

{% block version %}
2.7.1
{% endblock %}

{% block fetch %}
https://github.com/litespeedtech/ls-qpack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6b3af828c031b25e6447d8484d011ae55a9ccf4ea75f175a93a458fe9ea72ca0
{% endblock %}

{% block lib_deps %}
lib/c
lib/xxhash
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*LINK.*XXH.*||' \
    -i ${out}/lib/cmake/ls-qpack/ls-qpack-config.cmake
sed -e 's|.*LINK.*XXH.*||' \
    -i ${out}/lib/cmake/ls-qpack/ls-qpack-targets.cmake
{% endblock %}

{% block cmake_flags %}
LSQPACK_BIN=OFF
LSQPACK_XXH=OFF
{% endblock %}
