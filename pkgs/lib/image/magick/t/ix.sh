{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ImageMagick
{% endblock %}

{% block version %}
7.1.2.32
{% endblock %}

{% block fetch %}
https://ftp.icm.edu.pl/packages/ImageMagick/archive/releases/ImageMagick-{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}.{{self.version().strip() | field(2)}}-{{self.version().strip() | field(3)}}.tar.xz
9f32b378f14e6a5357b5b901351ebe8d8c8b86e6b7a4299b3c95336ecfc92642
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jxl
lib/png
lib/jpeg
lib/webp
lib/tiff
lib/lcms/2
lib/jpeg/open
{% if not wasi %}
lib/raw
lib/heif
lib/openexr
{% endif %}
{% endblock %}

{% block bld_libs %}
{% if wasi %}
lib/shim/setjmp
lib/shim/fake/header(header=sys/wait.h)
lib/shim/fake/header(header=pwd.h)
lib/shim/fake/pkg(pkg_name=libjxl_threads,pkg_ver=0.12.0)
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block patch %}
sed -e 's|.*operator new.*|#include <new>|' \
    -i Magick++/lib/Magick++/Include.h
{% if wasi %}
# no libjxl_threads on wasi: decode on the calling thread
cat << 'EOF' > coders/ix_jxl_runner.h
#pragma once
#include <stddef.h>
#define JxlThreadParallelRunner NULL
static void *JxlThreadParallelRunnerCreate(const void *mm, size_t n) { (void)mm; (void)n; return (void *)1; }
static void JxlThreadParallelRunnerDestroy(void *r) { (void)r; }
EOF
sed -e 's|<jxl/thread_parallel_runner.h>|"ix_jxl_runner.h"|' -i coders/jxl.c
# no processes and no password database on wasi
sed -e 's|return(popen(command,type));|return((void) command,(void) type,(FILE *) NULL);|' \
    -i MagickCore/utility-private.h
sed -e 's|#if defined(MAGICKCORE_POSIX_SUPPORT) \&\& !defined(__OS2__)|#if 0|' \
    -i MagickCore/utility.c
sed -e 's|status=system(sanitize_command);|status=(-1);|' \
    -i MagickCore/delegate.c
{% endif %}
{% endblock %}

{% block configure_flags %}
--with-jxl=yes
{% if wasi %}
--without-threads
--disable-openmp
--without-modules
--enable-zero-configuration
--without-magick-plus-plus
--without-x
--without-fontconfig
--without-freetype
--without-heic
--without-raw
--without-openexr
--without-bzlib
--without-zip
--without-xml
{% endif %}
{% endblock %}
