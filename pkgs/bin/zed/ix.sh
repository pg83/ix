{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
zed
{% endblock %}

{% block version %}
0.148.1
{% endblock %}

{% block cargo_url %}
https://github.com/zed-industries/zed/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
065a2ab66fa8a8b3266cb6714e8966e3ef512cb5c4c55e1b5248a582f636ab56
{% endblock %}

{% block bld_libs %}
lib/z
lib/zstd
lib/curl
lib/alsa
lib/git/2
lib/opengl
lib/openssl
lib/sqlite/3
lib/fontconfig
lib/xkb/common
lib/vulkan/loader
lib/vulkan/headers
lib/shim/fake(lib_name=xcb)
lib/shim/fake(lib_name=xkbcommon-x11)
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

{% block cargo_bins %}
zed
{% endblock %}
