{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libuv
{% endblock %}

{% block version %}
1.44.2
{% endblock %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e6e2ba8b4c349a4182a33370bb9be5e23c51b32efb9b9e209d0e8556b73a48da
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBUV_BUILD_TESTS=OFF
LIBUV_BUILD_BENCH=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|_a.a|.a|' -i ${out}/lib/cmake/libuv/libuvConfig-release.cmake
rm ${out}/lib/pkgconfig/libuv-static.pc ${out}/lib/libuv_a.a
{% endblock %}
