{% extends '//lib/llvm/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/17/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/kernel
lib/shim/alloc
{% endif %}
{% if sanitize %}
lib/build/sanitize/hack_cmake
{% endif %}
{% endblock %}

{% block cmake_flags %}
{{super()}}

LIBCXXABI_ENABLE_SHARED=NO
LIBCXXABI_ENABLE_STATIC=YES

LIBUNWIND_ENABLE_SHARED=NO
LIBUNWIND_ENABLE_STATIC=YES

LIBCXX_ENABLE_SHARED=NO
LIBCXX_ENABLE_STATIC=YES
LIBCXX_CXX_ABI=libcxxabi
LIBCXX_USE_COMPILER_RT=NO

# be like Google
LIBCXX_ABI_VERSION=999
LIBCXX_ABI_NAMESPACE=__1
LIBCXX_ABI_UNSTABLE=ON

LLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind"
{% endblock %}

{% block cmake_srcdir %}
runtimes
{% endblock %}

{% block ninja_targets %}
cxx
cxxabi
unwind
{% endblock %}

{% block ninja_install_targets %}
install-cxx
install-cxxabi
install-unwind
{% endblock %}

{% block cpp_defines %}
_LIBUNWIND_USE_DLADDR=0
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_includes %}
${PWD}/libunwind/include
{% endblock %}

{% block setup_target_flags %}
{#/ix/store/JOyuvunDkp0N3TP9-lib-c-plus-plus-15/lib/libc++.a:locale.cpp.o: 0000000000000000 W strtoull_l, broke glib#}
export CFLAGS="${CFLAGS} -O2"
{% endblock %}

{% block patch %}
{{super()}}
{% if darwin %}
# or else we break on weak symbol, implemented in cxa_thread_exit.cpp
cat << EOF >> libcxxabi/src/cxa_guard.cpp
void* __cxa_thread_atexit_impl;
EOF
{% endif %}
sed -e 's|.*define _LIBCPP_ABI_ALTERNATE_STRING_LAYOUT.*||' -i libcxx/include/__config
cat libcxx/CMakeLists.txt \
    | grep -v 'is reserved for use by libc' \
    > _ && mv _ libcxx/CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv include/c++/v1/* include/
# clash with HP unwind
mv ${out}/lib/libunwind.a ${out}/lib/libc++unwind.a
{% if darwin %}
llvm-objcopy --redefine-sym ___muloti4=___libcplpl_muloti4 ${out}/lib/libc++.a
{% endif %}
{% if sanitize %}
for lib in libc++unwind.a libc++abi.a
do
  ${IX_SANITIZER_SYMBOL_REDEFINER} ${out}/lib/${lib}
done
{% endif %}
{% endblock %}

{% block test %}
cat ${out}/include/__config_site | grep LIBCPP_ABI
{% endblock %}
