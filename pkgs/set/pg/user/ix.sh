{% extends '//die/hub.sh' %}

{# this is my home config, for demonstration purposes  #}
{# one can make an overlay in private git repo instead #}

{% block run_deps %}
bin/mc
bin/git
bin/mpv
bin/ted
bin/wget
bin/curl
bin/htop
bin/bash
bin/less
set/debug
bin/wirez
bin/zutty
bin/psmisc
bin/evince
bin/im/play
bin/openssl
bin/iwd/ctl
bin/swayimg
bin/tcpdump
bin/unbound
bin/git/lfs
bin/dns/masq
bin/sing/box
bin/xdg/open
bin/tun2socks
bin/fontconfig
bin/quake/1/vk
set/box/gnu/tools
bin/python/frozen
bin/brightnessctl
bin/imway(stalix=1)
set/pg/user/scripts
bin/coreutils/uutils
bin/minio/client/patched
{% endblock %}

{% block run_data %}
set/fonts/default
aux/fonts/ms/cascadia
{% endblock %}
