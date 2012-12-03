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
xcompmgr &

xset -b b off
xsetroot -cursor_name left_ptr
setxkbmap -option ctrl:nocaps
xrdb -load ${HOME}/.Xresources
xmodmap -e 'remove mod4 = Super_R'
xmodmap -e 'add mod3 = Super_R'
xmodmap -e 'keycode 197 = XF86ModeLock'
xrandr --output DVI-0 --primary 
xrandr --output DVI-1 --left-of DVI-0 
xrandr --output DisplayPort-0 --right-of DVI-0

conky &
emacs --daemon &

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
