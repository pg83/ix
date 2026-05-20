{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.145
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
b3ffbc12689bfe81389d6577787fcea4cab81bd3b6bba9b719e73770b62d720e
https://geo.mirror.pkgbuild.com/core/os/x86_64/glibc-2.43+r22+g8362e8ce10b2-2-x86_64.pkg.tar.zst
2c20828b3a571b272697671c90b1e3a8c426d6a7e7fb99a242099373f2710fe1
{% endblock %}

{% block bld_tool %}
bld/zstd
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir -p ${out}/bin/usr

install -Dm755 ${src}/claude ${out}/bin/claude.bin

mkdir glibc
cd glibc
zstd -dc ${src}/glibc-*.pkg.tar.zst | bsdtar -x -f - --no-same-permissions --no-same-owner
cd ..

cp -a glibc/usr/lib ${out}/bin/usr/

cat << EOF > ${out}/bin/claude.exe
#!/usr/bin/env sh
set -eu

d="\$(CDPATH= cd -- "\$(dirname -- "\$0")" && pwd)"

exec "\${d}/usr/lib/ld-linux-x86-64.so.2" \
    --library-path "\${d}/usr/lib" \
    "\${d}/claude.bin" "\$@"
EOF

chmod +x ${out}/bin/claude.exe
{% endblock %}

{% block postinstall %}
:
{% endblock %}
