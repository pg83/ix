{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
oneTBB
{% endblock %}

{% block version %}
2022.1.0
{% endblock %}

{% block fetch %}
https://github.com/oneapi-src/oneTBB/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ed067603ece0dc832d2881ba5c516625ac2522c665d95f767ef6304e34f961b5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ucontext
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block setup_tools %}
ln -s $(which llvm-install-name-tool) install_name_tool
{% endblock %}

{% block patch %}
sed -e 's|.*#pragma weak.*||' -i src/tbb/itt_notify.cpp
{% endblock %}

{% block cmake_flags %}
TBB_TEST=OFF
TBB_STRICT=OFF
TBBMALLOC_BUILD=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Threads::Threads|c|' -i ${out}/lib/cmake/TBB/TBBTargets.cmake
{% endblock %}
