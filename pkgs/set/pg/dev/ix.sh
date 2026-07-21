{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/jq
bin/gdb
bin/sed
bin/make
bld/cmake
bld/ninja
bin/patch
bin/strace
set/dev/cc
set/dev/cc
set/dev/go
bin/bash/5
bin/glslang
bld/wayland
bld/meson/4
bin/python/14
bin/coreutils
bin/diffutils
bin/findutils
bin/gawk/lite
bin/file/host
bin/rip/grep
bin/grep/patched
bin/grep/scripts
bin/dash/lite/sh
set/pg/dev/libs(kind=lib,vulkan=amd/radv,stalix=1)
{% endblock %}
