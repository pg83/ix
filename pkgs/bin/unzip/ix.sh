{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz
md5:62b490407489521db863b523a7f86375
https://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-26.debian.tar.xz
md5:e2bf7537e1ca821f6059ee84e7ae76a5
{% endblock %}

{% block unpack %}
mkdir src; cd src
for x in ${src}/*; do
    extract 0 ${x}
done
cd unzip*
{% endblock %}

{% block setup %}
export CPPFLAGS="-include time.h ${CPPFLAGS}"
{% endblock %}

{% block patch %}
for i in ../debian/patches/*.patch; do
    cat "${i}" | patch -p1
done
{% endblock %}

{% block make_flags %}
-f unix/Makefile
MANDIR=${out}/share/man/man1
{% endblock %}

{% block make_target %}
macosx
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
