{% extends '//die/hub.sh' %}

{# broken or too heavy
#bin/gthumb
#bin/re2g
#bin/lldb
#bin/minibrowser
#bin/icontool
#bin/chromium
#bin/porto
#bin/putty
#bin/surfer
#bin/freeglut
#bin/star
#bin/rofi
#bin/cog
#bin/webview
#bin/telegram/web/z
#bin/telegram/web/old
#bin/telegram/web/k
#bin/vlc
#bin/uftrace
#bin/catboost
#bin/ispc
#bin/mutter
#bin/code/blocks
#bin/pcsx2
#bin/claws/mail
#bin/samba
#bin/grv
#bin/efitools
#bin/colord
#bin/tex/studio
#bin/rr
#bin/gendesk
#bin/cups
#bin/ras/daemon
#bin/ff/play
#bin/npm
#bin/yt
#bin/inkscape
#bin/balsa
#bin/scummvm
#bin/code/lite
#}

{% block run_deps %}
bin/agrep
bin/wstunnel
bin/tun2socks
bin/postgresql/17
bin/actkbd
bld/git
bin/dcraw
bin/e2tools
bin/httping
bin/cast/text
bin/impala
bin/mrustc/cargo
bin/mrustc
bin/mrustc/boot
bin/curl/ngtcp2
bin/evdev
bin/bloaty
bin/ultra/hdr/app
bin/xdg/dbus/proxy
bin/elementary/screenshot
bin/sway(mesa_driver=iris)
bin/sway(mesa_driver=radeonsi)
bin/llvm/spirv
bin/elementary/dock
bin/ebpf/verifier
bin/cpu/fetch
bin/ubpf
bin/scx
bin/python/13
bin/go/lang/23
bin/lapce
bin/cosmic/comp
bin/evsieve
bin/erofs/utils
bin/mutter
bin/elementary/files
bin/elementary/terminal
bin/avizo
bin/valkey
bin/minder
bin/sway/nc
bin/dino
bin/vala
bin/vala/bootstrap
bin/clapper
bin/kernel/6/10
bin/nftables
bin/bpf/tool
bin/iron/bar
bin/gdb/14
bin/gdb/15
bin/skia/svg
bin/ladybird
bin/cvt
bin/modetest
bin/sh/fmt
bin/super/file
bin/mujs
bin/grpc/java
bin/time/limit
bin/nscd
bin/yofi
bin/port/forwarder/rs
bin/upnpc
bin/smart/mon/tools
bin/q/cache/grind
bin/sysprof
bin/gcc/14
bin/amixer
bin/kms/con
bin/kms/con/full
bin/kms/con/pretty
bin/kms/con/fast
bin/g/bsd/dialog
bin/rqbit
bin/shot/man
bin/sway/fx
bin/dns/proxy
bin/openntpd
bin/yazi
bin/util/wipefs
bin/bcache/tools
bin/lxqt/askpass
bin/waycheck
bin/gdu
bin/greetd
bin/mount
bin/btfs
bin/tinc
bin/yggdrasil/go
bin/fire/jail
bin/minio
bin/dropbear/2024
bin/nebula
bin/mcelog
bin/iperf
bin/iperf/3
bin/qemu/8/1
bin/qemu/8/2
bin/coreutils/9/5
bin/wak
bin/q/bittorrent/nox
bin/wl/color/picker
bin/cg
bin/chrony/runit
bin/yash/lite
bin/irq/balance
bin/go/smee
bin/bcrypt
bin/reproxy
bin/q/bittorrent/nox
set/stalix/server
bin/prometheus/node/exporter
bin/clang/18/bootstrapped
bin/sndio
bin/vsftpd
bin/nfs/ganesha
bin/prometheus
bin/mdns/dns
bin/avahi/dns
bin/patch/darwin
bin/mdns/responder
bin/file/roller
bin/darktable
bin/ptyxis
bin/avahi
bin/mdadm
bin/clx
bin/corsixth
bin/dns/x
bin/miller
bin/u/root
bin/pspy
bin/capnc
bin/dosbox/x
bin/fluid/synth
bin/dosbox/staging/debug
bin/dosbox/staging
bin/meson/1/2
bin/meson/1/3
bin/gnome/keyring
bin/secret/tool
bin/su/exec
bin/copyq
bin/keepass/xc
bin/psensor
bin/mplayer
bin/wx/maxima
bin/maxima
bin/sbcl
bin/ddc/control
bin/lftp
bin/axel
bin/tvedit
bin/app/image/tool
bin/cage/break
bin/dialog
bin/niri
bin/bcache/fs/tools
bin/cargo/whatfeatures
bin/alacritty
bin/bat
bin/wl/maker
bin/kati
bin/tty/plot
bin/pass/secrets
bin/sd/bus/codegen
bin/geeqie
bin/senpai
bin/go/sh
bin/go/sh/posix
bin/go/top
bin/d/spy
bin/dbus/broker
bin/acpi/ca
bin/quaternion
bin/ssh/3
bin/go/muks
bin/nheko
bin/kms/xx
bin/muslstack
bin/aom
bin/tinylog
bin/qemacs
bin/uasm
bin/celluloid
bin/less/gnu
bin/kitty
bin/xfsprogs/6/1
bin/xfsprogs/6/latest
bin/qtile
bin/dconf
bin/fastfetch
bin/gnome/terminal
bin/speedtest/cli
bin/wmenu
bin/python/12
bin/ryzen/adj
bin/unionfs/fuse
bin/seer
bin/dxsc
bin/dwarf/dump
bin/rpm
bin/bluetuith
bin/glib/tools
bin/neo/vim/jit
bin/neo/vim/openresty
bin/zathura/unwrap/mupdf
bin/zathura/unwrap/poppler
bin/minijail
bin/hysteria
bin/ip/get
bin/clang/17
bin/sslh
bin/coreutils/9/4
bin/weechat
bin/python/9
bin/xml/b
bin/walk
bin/lld/16
bin/go/lang/21
bin/go/lang/22
bin/limine
bin/emacs/gtk
bin/knot/resolver
bin/whois
bin/esbuild
bin/redo
bin/ip/route2
bin/sddm
bin/ghost/script
bin/havoc
bin/protoc/c
bin/systool
bin/hwinfo
bin/xxd
bin/yajl
bin/wazero
bin/wasm/edge/aot
bin/wasm/edge
bin/wasm/3
bin/fizzy
bin/wabt/wasi
bin/binaryen
bin/wabt
bin/wamrc
bin/iwasm
bin/iwasm/fast
bin/iwasm/fast/er
bin/tcpreplay
bin/cppgir
bin/rpcgen
bin/nfs/utils
bin/redis/lite
bin/dnsmasq
bin/go/awk
bin/sniffer
bin/webp/gui
bin/links/sdl
bin/icc
bin/xdg/desktop/portal/ix
bin/qpack
bin/lvm2
bin/ag
bin/mkvtoolnix
bin/mkvtoolnix/gui
bin/sdlpop
bin/jpegoptim
#bin/openttd
bin/pngquant
bin/glmark2
bin/wayland/tracer
bin/stp
bin/cpu/id
bin/smenu
bin/tty/d
bin/svgren
bin/transmission/qt
bin/tor
bin/empty
bin/zutils
set/stalix
bin/dinit
bin/i2pd
bin/lite/xl
bin/gparted
bin/havaged
bin/rng/tools
bin/gcc/11
bin/gcc/env
bin/gcc/12
bin/gcc/13
bin/gcc/10
bin/gcc/9
bin/gcc/8
bin/gcc/7
bin/gcc
bin/gcc/cc/scripts
bin/gcc/cc
bin/zsh
bin/gdb
bin/btop++
bin/mosh
bin/dbus/sys
bin/dbus/runit
bin/dbus/runit/scripts
bin/dbus
bin/dbus/session
bin/patch/elf
bin/dwl
bin/cctools
bin/syslog/ng
bin/help2man
bin/clang/14/gcc
bin/clang/14/tst
bin/clang/15/gcc
bin/clang/15
bin/clang/15/full
bin/clang/16
bin/clang/16/format
bin/clang/16/bootstrapped
bin/clang/env
bin/clang/env/wrapper
bin/jed
bin/binutils
bin/quake/1/vk/pg83
bin/quake/1/vk/novum
bin/quake/1/vk
bin/quake/2/yamagi
bin/quake/3/e
bin/sbase
bin/scdoc
bin/ed
bin/xml/to
bin/iw
bin/bsdutils
bin/nasm
bin/mold
bin/net/tools
bin/grub/efi
bin/grub/bios
bin/ragel/6
bin/wofi
bin/most
bin/procps/ng
bin/jackd
bin/less
bin/gptfdisk
bin/cmake/lite
bin/cmake/gui
bin/cmake
bin/dropbear
bin/dropbear/runit
bin/heirloom/ed
bin/weston
bin/slurp
bin/mingetty/runit
bin/mingetty
bin/git
bin/git/2
bin/git/go
bin/kernel/6/6
bin/swayimg
bin/mc/slang
bin/mc/curses/n
bin/mc/curses/netbsd
bin/mc
bin/gzip
bin/rlwrap
bin/m4/19
bin/m4/18
bin/m4/quasar
bin/m4
bin/wireless/tools
bin/e2fsprogs
bin/grep
bin/seatd/sys
bin/seatd/runit
bin/seatd
bin/groff
bin/nnn
bin/bison/3/8
bin/bison/3/7
bin/bison/3/6
bin/tar
bin/byacc/bt
bin/byacc/yacc
bin/byacc
bin/swappy
bin/openvpn
bin/xfsprogs
bin/toybox
bin/parted
bin/p7zip
bin/time
bin/dhcpcd/sys
bin/dhcpcd/runit
bin/dhcpcd
bin/gn
bin/glib/codegen
bin/pv
bin/sway/tools
bin/sway/lock
bin/sway/idle
bin/sway/bg
bin/sway
bin/bmake
bin/waybar
bin/mandoc
bin/sud
bin/stdman
bin/graphviz
bin/mawk
bin/scons
bin/links
bin/upx
bin/yambar
bin/ted
bin/gperf
bin/imv
bin/b64
bin/kitty
bin/nano
bin/wget/2
bin/wget
bin/nwipe
bin/unzip
bin/doxygen
bin/grim
bin/yash/sh
bin/yash
bin/samurai
bin/btrfs/progs
bin/crun
bin/lzip
bin/bc/gavin
bin/bc/gnu
bin/bc
bin/diffutils
bin/gyp
bin/foot
bin/emacs
bin/yasm
bin/findutils
bin/hdparm
bin/patch
bin/which
bin/subversion
bin/pciutils
bin/gettext
bin/strace
bin/screen
bin/gawk
bin/gawk/lite
bin/iwd/runit
bin/iwd
bin/efibootmgr
bin/ecl
bin/mrsh
bin/mdevd/runit
bin/mdevd
bin/base64
bin/turbo
bin/dhclient
bin/busybox
bin/swig/4
bin/epiphany
bin/dosfstools
bin/openssh
bin/openssh/client
bin/openssh/d
bin/bash/4
bin/bash/5
bin/bash/3
bin/bash/lite/sh
bin/bash/lite
bin/bash
bin/sed
bin/neo/vim
bin/light
bin/go/lang/4
bin/go/lang/19
bin/go/lang/20
bin/zip
bin/zip/tool
bin/openssl
bin/getopt
bin/pm/utils
bin/vbetool
bin/wpa/supplicant
bin/ninja
bin/ethtool
bin/flex
bin/auto/conf/archive
bin/auto/conf/xorg
bin/auto/conf/2/69
bin/auto/conf/2/71
bin/auto/make/1/16/1
bin/auto/make/1/16/3
bin/auto/make/1/16/5
bin/unrar
bin/usbutils
bin/tmux
bin/make/lite
bin/make
bin/make/old
bin/tcsh
bin/nawk
bin/far2l
bin/far2l/wx
bin/util/linux
bin/runit/sys
bin/runit
bin/mksh
bin/coreutils/8/31
bin/coreutils/8/32
bin/coreutils/9/0
bin/coreutils/9/1
bin/coreutils/lite
bin/coreutils
bin/f2fs/tools
bin/b2
bin/exfat/progs
bin/exfat/utils
bin/jfs/utils
bin/cabextract
bin/bsdtar/lite
bin/bsdtar
bin/file
bin/xz
bin/zstd
bin/brotli
bin/bzip2
bin/gdbm
bin/idn/2
bin/idn
bin/libtool
bin/cardboard
bin/openresolv/runit
bin/kbd
bin/fixtty
bin/keyd
bin/cpio
bin/xml/lint
bin/curl/lite
bin/curl/mbedtls
bin/curl/bearssl
bin/curl/openssl
bin/curl
bin/curl/ms
bin/curl/wolf
bin/curl/gnutls
bin/wayland/utils
bin/wayland/info
bin/wayland/protocols
bin/wayland/scanner
bin/wev
bin/wlrctl
bin/unbound
bin/execline
bin/xsltproc
bin/jq
bin/webkitproc
bin/acpi/d/2
bin/acpi/d/rules
bin/acpi/d/runit
bin/acpi/d/d
bin/net/cat
bin/basuctl
bin/xml/wf
bin/uconv
bin/pcregrep/2
bin/pcregrep
bin/protoc
bin/orc
bin/xxhsum
bin/openvi
bin/openvi/stalix
bin/evince
bin/djvulibre
bin/avif
bin/intltool
bin/labwc
bin/fish
bin/sqlite3
bin/mimetype
bin/nmap
bin/rsync
bin/runsrv
bin/dcron
bin/tcpdump
bin/giflib
bin/tiff
bin/nsstools
bin/wob
bin/fheroes2
bin/iconv
bin/glslang
bin/minigzip/gzip
bin/minigzip
bin/subreaper
bin/zathura
bin/poppler
bin/elfutils
bin/fontconfig
bin/dav1d
bin/re2c
bin/aserver
bin/tinyalsa
bin/alsa/utils
bin/sndio/runit
bin/sndio/ctl
bin/sndio/d
bin/fribidi
bin/gnome/console
bin/gnome/text/editor
bin/gnome/font/viewer
bin/loksh
bin/nvme/cli
bin/potrace
bin/sassc
bin/vte
bin/wayfire/shell
bin/wayfire
bin/vulkan/tools
bin/sndfile
bin/openal
bin/harfbuzz
bin/xkbcli
bin/memcached
bin/pkg/conf
bin/slibtool
bin/minised
bin/moe
bin/mupdf
bin/python/lite
bin/python/huge
bin/python/8
bin/python/10
bin/python/11
bin/python
bin/jbig2dec
bin/mako
bin/ndhc
bin/perl/host
bin/perl
bin/ly/sys
bin/ly/runit
bin/ly
bin/lavalauncher
bin/fuzzel
bin/atop
bin/soupget
bin/input/tools
bin/pkg/config
bin/wl/clipboard
bin/wl/sunset
bin/wl/mirror
bin/wl/opm
bin/nwg/launchers
bin/nwg/drawer
bin/nwg/menu
bin/nwg
bin/nwg/dock
bin/fnott
bin/brightnessctl
bin/vim/g
bin/vim
bin/dosbox
bin/st/sdl/2
bin/transmission/gtk
bin/transmission/remote
bin/transmission
bin/stalld/runit
bin/stalld
bin/grpc/codegen
bin/vifm
bin/dte
bin/joe
bin/kakoune
bin/exif
bin/mtools
bin/fdupes
bin/ft2demos
bin/exr
bin/valgrind
bin/hikari
bin/drill
bin/msh3app
bin/exiv2
bin/tree
bin/ntp
bin/lsof
bin/telegram
bin/hypr
bin/schedtool
bin/cpu/limit
bin/opj
bin/xpdf
bin/heif
bin/mpg123
bin/lame
bin/sox
bin/q/jackctl
bin/q/imgv
bin/q/bittorrent
bin/q/mmp
bin/svt/hevc
bin/svt/av1
bin/ugrep
bin/mg
bin/waf
bin/mpv
bin/glslc
bin/htop
bin/iwgtk
bin/notify/send
bin/ananicy/rules
bin/ananicy/runit
bin/ananicy/good
bin/ananicy
bin/schedrr
bin/xdg/open
bin/xdg/desktop/portal/gtk
bin/xdg/desktop/portal
bin/psmisc
bin/dunst
bin/perf
bin/numactl
bin/gold
bin/ld
bin/ar
bin/aria/2
bin/gas
bin/slsh
bin/nghttp2
bin/pqiv
bin/gtk/doc
bin/gtk/lock
bin/pcmanfm
bin/cpu/power
bin/sfwbar
bin/wayclip
bin/sysklogd
bin/dos2unix
bin/squid
bin/inotify/tools
bin/cras
bin/redis
bin/strawberry
bin/bind
bin/lisgd
bin/mariadb/10
bin/mariadb/11
bin/nvtop
bin/postgresql/15
bin/postgresql/16
bin/catatonit
bin/wireshark
bin/7z
bin/haproxy
bin/fsearch
bin/bzip3
bin/lightgbm
bin/dmidecode
bin/qrencode
bin/fswatch
bin/xarchiver
bin/jasper
bin/earlyoom
bin/chrony
bin/convert
bin/catimg
bin/ccache
bin/bsdiff
bin/traceroute
bin/xinetd
bin/ncdu
bin/lshw
bin/jxl
bin/chafa
bin/pango
bin/tesseract
bin/z3
bin/inetutils
#bin/poedit
bin/wxrc
bin/clifm
bin/reddit/desktop
bin/iotop
bin/uriparser
bin/urldec
bin/qpdf
bin/i3/status
bin/gnupg
bin/sixel
bin/neo/mutt
bin/uuencode
bin/uget
bin/gnuplot
bin/gnuplot/wx
bin/fetchmail
bin/xchm
bin/tig
bin/spotify/qt
bin/mbedtls/3
bin/shepherd
bin/got
bin/tldr/c
bin/tldr/go
bin/tldr
bin/interception/tools
bin/pstree
bin/fzy
bin/wf/recorder
bin/mle
bin/sfm
bin/imhex
bin/stunnel
bin/emptty
bin/fzf
bin/micro
bin/termshark
bin/wtf
bin/elvish
bin/gh
bin/curlie
bin/autologin
bin/autologin/runit
bin/getent
bin/go/pass
bin/shadowsocks/go/2
bin/shadowsocks/libev
bin/task
bin/assemble
bin/duf
bin/lf
bin/lazygit
bin/chroma
bin/v
bin/wvkbd
bin/nodejs
bin/tinyssh
bin/lz4
bin/setcwd
bin/rizin
bin/adig
bin/webp
bin/de265
bin/squashfs/fuse
bin/squashfs/tools
bin/man/db
bin/kuroko
bin/kuroko/lite
bin/bim
bin/et
bin/socat
bin/rhash
bin/vis
bin/w3m
bin/tea
bin/ladybird
bin/shadow
bin/pdpmake
bin/premake
bin/efsw
bin/lm/sensors
bin/lowdown
bin/nix
bin/fusermount/3
bin/fusermount/2
bin/powertop
bin/f2c
bin/cage
bin/incron
bin/rubber/band
bin/vcpkg
bin/thermald
bin/upower
bin/9base
bin/etcd
bin/freerdp
bin/lsyncd
bin/kanshi
bin/varlink
bin/iozone
bin/kmod
bin/svg2png
bin/llama
bin/ip/utils
bin/wayst
bin/tex/info
bin/feather/pad
bin/hunspell
bin/geany
bin/dash/sh/old
bin/dash/sh
bin/dash
bin/zenity
bin/zenity/3
bin/zenity/4
bin/unifdef
{% endblock %}
