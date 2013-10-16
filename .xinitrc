#!/bin/sh -l

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export LANG=en_GB.UTF-8

eval $(gpg-agent --daemon) &
export GPG_AGENT_INFO

compton -cGb 

xrdb -load ${HOME}/.Xresources
xsetroot -cursor_name left_ptr -solid '#002b36'

xrandr --output DVI-0 --primary
xrandr --output DVI-1 --left-of DVI-0
xrandr --output DisplayPort-0 --right-of DVI-0

xset s 90
xss sxlock &
pulseaudio --start &
urxvtd &
unclutter &
conky &
rescuetime &
pidgin &
google-chrome --profile-directory=GoogleMusic --app=http://play.google.com/music &
urxvtc &
emacsclient -a '' -c &
(sleep 3 && das-keyboard.sh) &
# needed for some jvm apps :-/
export _JAVA_AWT_WM_NONREPARENTING=1
exec xmonad
