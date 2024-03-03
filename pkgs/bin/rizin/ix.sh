{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/rizinorg/rizin/releases/download/v0.7.1/rizin-src-v0.7.1.tar.xz
sha:149dc8eed4070089b6e4e65071d55f571c0d2e4c72d2ee420562a2321308c294
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/xz
lib/lz4
lib/zip
lib/magic
lib/kernel
lib/xxhash
lib/pcre/2
lib/openssl
lib/cap/stone
lib/shim/fake/pkg(pkg_name=pcre2,pkg_ver=100.500)
lib/shim/fake/pkg(pkg_name=pcre2_cross_native,pkg_ver=100.500)
{% endblock %}

{% block meson_flags %}
blob=true
subprojects_check=false
static_runtime=true
enable_tests=false
enable_rz_test=false
use_sys_capstone=enabled
use_sys_magic=enabled
use_sys_libzip=enabled
use_sys_zlib=enabled
use_sys_lz4=enabled
use_sys_lzma=enabled
use_sys_libzstd=enabled
use_sys_xxhash=enabled
use_sys_openssl=enabled
use_sys_pcre2=enabled
{% endblock %}

{% block meson_strip_wrap %}
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|include <capstone.h>|include <capstone/capstone.h>|' -i "${l}"
done
{% endblock %}

{% block c_rename_symbol %}
buffer_init
{% endblock %}
