{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mkvtoolnix
{% endblock %}

{% block version %}
95.0
{% endblock %}

{% block fetch %}
https://codeberg.org/mbunkus/mkvtoolnix/archive/release-{{self.version().strip()}}.tar.gz
f21ed76b4096fc7d282026616afd8556d5076b621563b5642bff8e03ee5c49c7
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gmp
lib/fmt
lib/ebml
lib/cmark
lib/boost
lib/pugixml
lib/matroska
lib/utf8/cpp
lib/xiph/ogg
lib/qt/6/svg
lib/qt/6/base
lib/xiph/flac
lib/xiph/vorbis
lib/json/nlohmann
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bld/ruby
bld/qt/6
bin/rsync
bld/gettext
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block configure_flags %}
--enable-static-qt
--with-qmake6=ixqmake6
--with-docbook_xsl_root=${out}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block setup_tools %}
mkdir QT

echo "${QT_PATH}" | tr ':' '\n' | while read l; do
    rsync -a ${l}/* QT/
done

qqq=$(dirname $(dirname $(which qmake6)))

rsync -a ${qqq}/* QT/

cd QT
ln -s bin libexec
cd ..

cat << EOF > qt.conf
[Paths]
Prefix = ${PWD}/QT
EOF

cat qt.conf

cat << EOF > ixqmake6
#!/usr/bin/env sh
qmake6 -qtconf ${PWD}/qt.conf "\${@}"
EOF

chmod +x ixqmake6
{{super()}}
{% endblock %}

{% block build %}
./drake -j ${make_thrs}
{% endblock %}

{% block install %}
./drake install
{% endblock %}
