{% extends '//die/nim/build.sh' %}

{% block pkg_name %}nitter{% endblock %}
{% block version %}2026.09.18-6cbe0d3{% endblock %}

{% block nim_url %}
https://github.com/pg83/nitter/archive/6cbe0d3e92c9ada415cfa13af6de7956742832ed.tar.gz
{% endblock %}

{% block nim_src_sha %}
d31621b3b135fc9a0ef856a27affc3cbc29327ba9dd2eeebc8af1ec41894322f
{% endblock %}

{% block nim_sha %}
20022a6e9e9307c03b23a680f3b74fb5e863f637f274841fa40b47392793f726
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/pcre
{% endblock %}

{% block host_libs %}
lib/c
lib/c++
lib/sass
lib/pcre
{% endblock %}

{% block nim_bin %}nitter{% endblock %}
{% block nim_main %}src/nitter.nim{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p1
{% include 'version.patch/base64' %}
EOF
{% endblock %}

{% block nim_flags %}
{{super()}}
--mm:refc
--dynlibOverrideAll
--passL:-lpcre
--passL:-lssl
--passL:-lcrypto
{% endblock %}

{% block build %}
{{super()}}
nimhost --dynlibOverrideAll --passL:-lsass --out:${tmp}/gencss tools/gencss.nim
${tmp}/gencss
nimhost -d:usePcreHeader --dynlibOverrideAll --passL:-lpcre \
    --out:${tmp}/rendermd tools/rendermd.nim
${tmp}/rendermd
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/share/nitter
cp -R public ${out}/share/nitter/
sed 's|staticDir = "./public"|staticDir = "'${out}'/share/nitter/public"|' \
    nitter.example.conf > ${out}/share/nitter/nitter.conf.example
{% endblock %}
