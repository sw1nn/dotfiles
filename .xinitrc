#!/bin/sh -l

# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export LANG=en_GB.UTF-8

gpg-agent --daemon \
          --display "${DISPLAY}" \
          --keep-display \
          --enable-ssh-support \
          --write-env-file "${HOME}/.gnupg/agent-info"

source ${HOME}/.gnupg/agent-info
export GPG_AGENT_INFO
export SSH_AUTH_SOCK

export CUPS_SERVER=localhost

compton -cCGb

xrdb -load ${HOME}/.Xresources
xsetroot -cursor_name left_ptr -solid '#002b36'

xrandr --output DVI-0 --primary
#xrandr --output DVI-1 --left-of DVI-0
#xrandr --output DisplayPort-0 --right-of DVI-0
xrandr --output HDMI-0 --right-of DVI-0
xrandr --output VGA-0 --left-of DVI-0


feh --bg-tile ${HOME}/backgrounds/default

source ${HOME}/.xflux-location

xflux -l ${LATITUDE} -g ${LONGITUDE}

xscreensaver &
emacs --daemon &
thunar --daemon &
pulseaudio --start &
unclutter &
conky &
rescuetime &
pidgin &
google-music &
KEYMAP="${HOME}/.XKeymap-$(hostname)"
test -f ${KEYMAP} && xkbcomp ${KEYMAP} ${DISPLAY}

# needed for some jvm apps :-/
export _JAVA_AWT_WM_NONREPARENTING=1
exec xmonad 2>&1 >| ${HOME}/.xmonad.log
