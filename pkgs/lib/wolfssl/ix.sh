{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
wolfssl
{% endblock %}

{% block version %}
5.8.2
{% endblock %}

{% block fetch %}
https://github.com/wolfSSL/wolfssl/archive/refs/tags/v{{self.version().strip()}}-stable.tar.gz
3ef126e3466e2f8f6ebb62b916a7f8fb26c6709dbdf2b63a167759f2fdb53068
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block configure_flags %}
--enable-all
--enable-opensslextra
--enable-opensslall
--enable-base64encode
--enable-pkcs11
--enable-reproducible-build
--enable-tls13
--enable-curl
{% endblock %}

{% block env %}
export CPPFLAGS="-DOPENSSL_EXTRA=1 -DOPENSSL_ALL=1 -DHAVE_ECC=1 \${CPPFLAGS}"
export COFLAGS="--with-wolfssl=${out} \${COFLAGS}"
export WOLFSSL_HEADERS=${out}/include/wolfssl
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
# colrm
bin/util/linux
{% endblock %}
