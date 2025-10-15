{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ispc
{% endblock %}

{% block version %}
1.18.1
{% endblock %}

{% block fetch %}
https://github.com/ispc/ispc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5b004c121e7a39c8654bb61930a240e4bd3e432a80d851c6281fae49f9aca7b7
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/llvm
lib/curses
lib/intel/tbb
{% endblock %}

{% block bld_tool %}
bld/m4
bld/flex
bld/bison
bld/python
bld/llvm/config
{% endblock %}

{% block cmake_flags %}
ISPC_INCLUDE_EXAMPLES=OFF
ISPC_INCLUDE_UTILS=OFF
ISPC_INCLUDE_TESTS=OFF
ISPCRT_BUILD_TASK_MODELS="TBB;Threads"
ISPCRT_BUILD_TASK_MODEL=TBB
{% endblock %}

{% block cmake_extra_flags %}
-DLLVM_CONFIG_EXECUTABLE=$(which llvm-config)
-DCLANG_EXECUTABLE=$(which clang)
-DCLANGPP_EXECUTABLE=$(which clang++)
-DLLVM_AS_EXECUTABLE=$(which llvm-as)
-DLLVM_DIS_EXECUTABLE=$(which llvm-dis)
{% endblock %}
