{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
grpc
{% endblock %}

{% block version %}
1.72.0
{% endblock %}

{% block git_repo %}
https://github.com/grpc/grpc
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
97434560ae08af1d90ecaec3640090377e2a47474772e46b97e8e25e2361366a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/re2
lib/c++
lib/c/ares
lib/openssl
lib/abseil/cpp
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
gRPC_ABSL_PROVIDER=package
gRPC_ZLIB_PROVIDER=package
gRPC_CARES_PROVIDER=package
gRPC_RE2_PROVIDER=package
gRPC_SSL_PROVIDER=package
gRPC_PROTOBUF_PROVIDER=package
gRPC_BUILD_CSHARP_EXT=OFF
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-missing-template-arg-list-after-template-kw -std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|std::result_of|absl::type_traits_internal::result_of|g' \
    -i src/core/lib/promise/detail/promise_like.h
{% endblock %}
