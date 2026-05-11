{% extends '//die/hub.sh' %}

{% block liib_deps %}
set/pg/llm/libs
{% endblock %}

{% block run_deps %}
bin/jq
bin/gdb
bin/sed
bin/make
#bin/perf
bin/patch
bin/wirez
bin/strace
set/dev/cc
set/dev/cc
set/dev/go
bin/ollama
bin/logcli
bin/bash/5
bin/tcpdump
bin/etcd/ctl
bin/python/14
bin/ip/route2
bin/coreutils
bin/diffutils
bin/findutils
bin/gawk/lite
bin/file/host
bin/grep/patched
bin/grep/scripts
bin/dash/lite/sh
set/pg/llm/libs(kind=lib)
{% endblock %}
