{% extends '//die/hub.sh' %}

{# all (std_box=) targets should be mentioned here #}

{% block run_deps %}
bld/nasm
bld/auto(conf_ver=2/71,std_box=bld/boot/box)
bld/auto/archive
bld/glib/old
bld/auto
bld/bash
bld/bison
bld/box
bld/byacc
bld/cmake
bld/flex
bld/glib
bld/gzip
bld/help2man
bld/m4
bld/make
bld/meson/1
bld/meson/2
bld/ninja
bld/perl
bld/pkg/config
bld/python
bld/re2c
bld/sh
bld/tar
bld/texinfo
bld/texinfo/lite
bld/compiler
bld/mold
bld/libtool
bld/cctools
bld/kuroko
bld/xz
bin/dash
{% endblock %}
