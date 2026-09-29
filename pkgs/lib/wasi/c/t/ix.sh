{# wasi-libc, the C library behind every wasi32 target here.

   Since wasi-sdk-26 the project builds with CMake, and the target is
   chosen by TARGET_TRIPLE. The old wasm32-wasi spelling is still
   accepted -- it means preview 1, the same as wasm32-wasip1 -- so the
   variants keep the names their consumers key on.

   Two of its cmake helpers reach for the network when a tool is not
   found: bindings.cmake downloads wit-bindgen to regenerate headers,
   and builtins.cmake fetches compiler-rt to link libc.so. Neither is
   needed. The headers are committed, and the shared library is not
   built at all in a static distribution; with BUILD_SHARED off the
   copy of libc.so never enters the default target, and with it goes
   the only consumer of the builtins download. compiler-rt reaches the
   final link through lib/c/bare, next to this library, as before. #}

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
wasi-libc
{% endblock %}

{% block version %}
34
{% endblock %}

{% block git_repo %}
https://github.com/WebAssembly/wasi-libc
{% endblock %}

{% block git_branch %}
wasi-sdk-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
1480f55766a91c98b1532700deee09a0e7f6ae8bf80cab3f895ea3bde28b9558
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED=OFF
BINDINGS_TARGET=OFF
{% block wasi_target %}
{% endblock %}
{% endblock %}

{% block install %}
{{super()}}
{# the sysroot lands as include/<triple>/ and lib/<triple>/; the
   headers stay under the triple, which is what consumers put on
   -isystem, and the archives move up to where -L finds them. The
   startup objects go into one archive so that -lcrt picks the right
   one by the symbol it needs. #}
cd ${out}
mv lib/wasm* nlib
rm -rf lib
mv nlib lib
cd lib
llvm-ar q libcrt.a *.o
rm *.o
{# the allocator comes from lib/c/alloc, as on every other target #}
llvm-ar d libc.a dlmalloc.c.o
{% endblock %}

{% block env %}
export ac_cv_func_memfd_create=no
export CPPFLAGS="-D_WASI_EMULATED_SIGNAL -D_WASI_EMULATED_PROCESS_CLOCKS -D_WASI_EMULATED_MMAN \${CPPFLAGS}"
export LDFLAGS="-static \${LDFLAGS}"
{% endblock %}
