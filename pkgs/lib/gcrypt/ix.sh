{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgcrypt
{% endblock %}

{% block version %}
1.12.4
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-{{self.version().strip()}}.tar.bz2
d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|#error|#warning|' -i random/jitterentropy-base.c
{% endblock %}

{% block configure_flags %}
{% if darwin or riscv64 %}
--disable-asm
{% endif %}
--disable-O-flag-munging
--disable-instrumentation-munging
{% endblock %}

{% block c_rename_symbol %}
gf_mul
{% endblock %}
