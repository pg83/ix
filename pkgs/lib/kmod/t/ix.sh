{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
kmod
{% endblock %}

{% block version %}
34.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/snapshot/kmod-{{self.version().strip()}}.tar.gz
57dd1236684071ead9a67eb8be42c369f1b67aa7280659616cc75f7e8b69f625
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/openssl
lib/shim/gnu/basename
{% endblock %}

{% block bld_libs %}
lib/shim/gnu/basename/overlay
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block configure_flags %}
--with-xz
--with-zlib
--with-zstd
--with-openssl
--disable-manpages
{% endblock %}

{% block patch %}
sed -e 's|.*is not supported by.*||' -i configure.ac
touch libkmod/docs/gtk-doc.make
rm autogen.sh
{% endblock %}

{% block build %}
{{super()}}
touch libkmod.so
touch man/modules.dep.bin.5
{% endblock %}
