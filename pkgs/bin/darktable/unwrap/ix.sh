{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
darktable
{% endblock %}

{% block version %}
4.0.0
{% endblock %}

{# TODO(pg): implement plugins support #}

{#
[77/795] Checking validity of cameras.xml
FAILED: lib/darktable/rawspeed/data/cameras.xml.touch /home/ci/ix_root/build/rMBCFa4qkoGgeRF6/obj/lib/darktable/rawspeed/data/cameras.xml.touch
cd /home/ci/ix_root/build/rMBCFa4qkoGgeRF6/obj/lib/darktable/rawspeed/data && /home/ci/ix_root/store/Dgvsu5w7rd9AaPhj-bin-xml-lint/bin/xmllint --nonet --valid --noout --schema /home/ci/ix_root/build/rMBCFa4qkoGgeRF6/src/src/external/rawspeed/data/cameras.xsd /home/ci/ix_root/build/rMBCFa4qkoGgeRF6/src/src/external/rawspeed/data/cameras.xml && /home/ci/ix_root/store/KRvCsUupqBGwnY6z-bin-cmake-lite/bin/cmake -E touch /home/ci/ix_root/build/rMBCFa4qkoGgeRF6/obj/lib/darktable/rawspeed/data/cameras.xml.touch
/home/ci/ix_root/build/rMBCFa4qkoGgeRF6/src/src/external/rawspeed/data/cameras.xsd:193: element complexType: Schemas parser error : complex type 'CFA2Type': The content model is not determinist.
WXS schema /home/ci/ix_root/build/rMBCFa4qkoGgeRF6/src/src/external/rawspeed/data/cameras.xsd failed to compile
#}

{% block fetch %}
https://github.com/darktable-org/darktable/releases/download/release-{{self.version().strip()}}/darktable-{{self.version().strip()}}.tar.xz
1416f8f59717e65a6220541aaa12eacca93888ce5176f2c9ab6c17b9cc53cc2d
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/lua
lib/png
lib/tiff
lib/glib
lib/avif
lib/heif
lib/webp
lib/rsvg
lib/curl
lib/jpeg
lib/xml/2
lib/gtk/3
lib/exiv2
lib/lcms/2
lib/secret
lib/openexr
lib/pugixml
lib/sqlite/3
lib/json/glib
lib/jpeg/open
lib/image/magick
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bash
bld/gettext
bld/intltool
bld/devendor
bin/xsltproc
bld/xml/lint
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block c_flags %}
-Wno-register
{% endblock %}

{% block cpp_defines %}
NATIVE_ARCH=1
{% endblock %}

{% block cmake_flags %}
USE_LUA=OFF
USE_XCF=OFF
USE_GMIC=OFF
USE_GAME=OFF
#USE_LIBRAW=OFF
USE_COLORD=OFF
USE_OPENMP=OFF
USE_OPENCL=OFF
USE_LENSFUN=OFF
ENABLE_JASPER=OFF
BUILD_CMSTEST=OFF
USE_IMAGEMAGICK=ON
USE_GRAPHICSMAGICK=OFF
BINARY_PACKAGE_BUILD=ON
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block build %}
devendor src/external/LibRaw
{{super()}}
{% endblock %}
