{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
EternalTerminal
{% endblock %}

{% block version %}
7.1.0
{% endblock %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v{{self.version().strip()}}.tar.gz
6c1eacb22f3465af8edcdd814318e5e23a4cf3b8fc2e50a2525d2b2b3bf44016
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/boost
lib/kernel
lib/sodium
lib/curses
lib/unwind
lib/openssl
lib/protobuf
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}

{% block cmake_flags %}
DISABLE_VCPKG=ON
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="${CXXFLAGS} -std=c++17"
{% endblock %}

{% block patch %}
sed -e '/list(APPEND _Unwind_LINK_LIBRARIES lzma)/d' \
    -i cmake/FindUnwind.cmake
{% endblock %}
