#!/bin/sh

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export LANG=en_GB.UTF-8

dropboxd &

setxkbmap -option ctrl:nocaps
xrdb -load ${HOME}/.Xresources
xrandr --output DFP1 --right-of DFP3
xrandr --output DFP4 --left-of DFP3

pulseaudio --start
conky &
emacs --daemon &
amarok &
thunar --daemon &

case $1 in 
    xmonad)
	nitrogen --restore &
	xmobar &
	conky &
	exec ssh-agent xmonad
        ;;
    xfce4)
	exec ssh-agent xfce4-session
        ;;
    *)
esac
