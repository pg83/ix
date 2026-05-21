{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
glibc
{% endblock %}

{% block version %}
2.43
{% endblock %}

{% block fetch %}
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

mkdir glibc
cd glibc
zstd -dc ${src}/glibc-*.pkg.tar.zst | bsdtar -x -f - --no-same-permissions --no-same-owner
cd ..

cp -a glibc/usr/lib ${out}/bin/usr/

# the ELF interpreter, exposed as /bin/ld-linux.so.2 once this package
# is installed into the system realm; the short path is what claude/code
# (and any other prebuilt glibc binary) patches into PT_INTERP
cp -L glibc/usr/lib/ld-linux-x86-64.so.2 ${out}/bin/ld-linux.so.2
{% endblock %}

{% block postinstall %}
:
{% endblock %}
