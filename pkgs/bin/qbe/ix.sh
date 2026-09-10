{% extends '//die/c/make.sh' %}

{% block pkg_name %}
qbe
{% endblock %}

{% block version %}
1.3
{% endblock %}

{% block fetch %}
https://c9x.me/compile/release/qbe-{{self.version().strip()}}.tar.xz
d587905d620dc5e1d2bfa7c2cc642b9b837aa89a3188c6e37b53d756cf66e320
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
# Upstream guesses with uname, which describes the builder, not the target.
cat << EOF > config.h
#define Deftgt T_{{{'x86_64': 'amd64_sysv', 'aarch64': 'arm64', 'riscv64': 'rv64'}[target.gnu_arch]}}
EOF
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}
