#!/bin/sh

export PATH=/home/pg/monorepo/imway/build-boot:/ix/realm/pg/bin:/bin

export XDG_SESSION_ID=$$
export XDG_DATA_DIRS="/ix/realm/${USER}/share"
export XDG_RUNTIME_DIR="${TMPDIR}"
export XCURSOR_SIZE=48
export QT_FONT_DPI=192
export GTK_A11Y=none

eval $(ssh-agent)

ssh-add ~/.ssh/*

exec imway --mode 3840x2160@120 --scale 2 --hdr 250 -- foot
