{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-greeter/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
b1463d268f70116b60f2e77a044f8356b6ccbd4d883fd2a118657fe53e273e9b
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/pam
lib/udev
lib/input
{% endblock %}

{% block host_libs %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block cargo_packages %}
cosmic-greeter-daemon
cosmic-greeter
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"runtime"|"static"|g' \
    -i vendored/bindgen/Cargo.toml
cat << EOF >> vendored/clang-sys/Cargo.toml
default = ["static"]
EOF
cat << EOF > vendored/clang-sys/build/static.rs
pub fn link() {
}
EOF
{% endblock %}
