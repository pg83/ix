{% extends '//die/hub.sh' %}

{# this is my home config, for demonstration purposes  #}
{# one can make an overlay in private git repo instead #}

{% block run_deps %}
bin/mc
bin/git
bin/mpv
bin/ted
bin/mako
bin/grim
bin/wget
bin/curl
bin/htop
bin/niri
bin/bash
bin/less
bin/iperf
bin/wirez
set/debug
bin/fuzzel
bin/waybar
bin/evince
bin/openssl
bin/sway/bg
bin/iwd/ctl
bin/swayimg
bin/tcpdump
bin/iron/bar
bin/sing/box
bin/epiphany
bin/telegram
bin/xdg/open
bin/tun2socks
bin/alacritty
bin/fontconfig
bin/brightnessctl
bin/q/cache/grind
set/pg/user/scripts
bin/coreutils/uutils
{% endblock %}

{% block run_data %}
set/fonts/default
aux/fonts/ms/cascadia
{% endblock %}
