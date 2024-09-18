{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/cilium/pwru/archive/refs/tags/v1.0.5.tar.gz
{% endblock %}

{% block go_sha %}
38aa1e210e9f07f229769547711ba89cacbde548693ce173ebbf000f80e6a7be
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/llvm/18
{% endblock %}

{% block bld_tool %}
bin/ld
{% endblock %}

{% block build %}
set -xue
export XDG_CONFIG_HOME=${tmp}
export HOME=${tmp}
export CC=clang-17
export LD=ld
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
export TARGET_GOARCH=amd64
go env -w "CC=clang-19"
go generate
{{super()}}
{% endblock %}
