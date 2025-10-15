{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
subversion
{% endblock %}

{% block version %}
1.14.5
{% endblock %}

{% block fetch %}
https://archive.apache.org/dist/subversion/subversion-{{self.version().strip()}}.tar.bz2
e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1
{% endblock %}

{% block bld_libs %}
lib/z
lib/lz4
lib/apr
lib/intl
lib/serf
lib/neon
lib/expat
lib/boost
lib/apr/util
lib/sqlite/3
lib/utf8/proc
{% endblock %}

{% block bld_tool %}
bld/python
bin/libtool/prev
bld/redir(from=python,to=python3)
{% endblock %}

{% block setup_target_flags %}
expat="$(pkg-config --variable=prefix expat)"
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=${expat}/include:${expat}/lib:-lexpat"
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/share/pkgconfig
{% endblock %}
