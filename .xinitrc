#!/bin/sh

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export LANG=en_GB.UTF-8

setxkbmap -option ctrl:nocaps
xrdb -load ${HOME}/.Xresources
xrandr --output DVI-0 --primary 
xrandr --output DVI-1 --left-of DVI-0 
xrandr --output DisplayPort-0 --right-of DVI-0

exec ssh-agent xfce4-session
