# Invoked from startup, we assume zsh.
#
# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

gpg-agent --daemon \
          --display "${DISPLAY}" \
          --keep-display \
          --write-env-file "${HOME}/.gnupg/agent-info"

export SSH_AUTH_SOCK=/tmp/neale/ssh-agent.sock

# Source Prezto.
source ${HOME}/.zprofile

export _JAVA_AWT_WM_NONREPARENTING=1

xrdb -load ${HOME}/.Xresources
xsetroot -xcf /usr/share/icons/Adwaita/cursors/top_left_arrow 16

xrandr --output DVI-0 --primary
#xrandr --output DVI-1 --left-of DVI-0
#xrandr --output DisplayPort-0 --right-of DVI-0
xrandr --output HDMI-0 --right-of DVI-0
xrandr --output VGA-0 --left-of DVI-0


feh --bg-tile ${HOME}/backgrounds/default

if [ -f ${HOME}/.xflux-location ]; then
  source ${HOME}/.xflux-location
fi

xflux -l ${LATITUDE} -g ${LONGITUDE}

if [ "$(hostname)" == "alison" ]; then
  conky &
fi

#git-annex assistant --autostart &
xscreensaver &
thunar --daemon &
unclutter &
rescuetime &

trackpad-ctl enable

browser &

rescuetime &

compton -c -o 0.5 &

KEYMAP="${HOME}/.XKeymap-$(hostname)"
test -f ${KEYMAP} && xkbcomp ${KEYMAP} ${DISPLAY}

compton -c -o 0.5 &

exec xmonad 2>&1 >| ${HOME}/.xmonad.log
