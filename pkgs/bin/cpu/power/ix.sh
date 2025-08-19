{% extends '//die/c/make.sh' %}

{% include '//bin/kernel/6/16/ver.sh' %}

{% block fetch %}
{{self.kernel_url().strip()}}
{{self.kernel_sha().strip()}}
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
{% endblock %}

{% block unpack %}
{{super()}}
cd tools/power/cpupower
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block make_flags %}
CC=clang
INSTALL=install
libdir=${out}/lib
bindir=${out}/bin
sbindir=${out}/bin
mandir=${out}/doc
docdir=${out}/doc
confdir=${out}/share
includedir=${out}/include
localedir=${out}/share/locale
bash_completion_dir=${out}/share/bash-completion/completions
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
