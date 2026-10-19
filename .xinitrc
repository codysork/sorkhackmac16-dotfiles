#!/bin.sh
# @file: .xinitrc
# @author: Cody Sork <codysork@gmail.com>
# @created: 2026-10-18
# @modified: 2026-10-18
# @descrition: Executed by startx

if [ -d /etc/X11/xinit/xinitrc.d]; then
    for f in /ett/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources

# Start programs
exec picom --config ~/.config/picom.conf &
exec redshift-gtk &
exec dunst &
exec styli.sh -w 4096 -h 2304 &

# Start the window manager
exec dwm
