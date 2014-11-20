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
          --enable-ssh-support \
          --write-env-file "${HOME}/.gnupg/agent-info"

source ${HOME}/.zshenv

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

TERM=xterm-256color emacs --daemon &
git-annex assistant --autostart &
xscreensaver &
thunar --daemon &
pulseaudio --start &
unclutter &
rescuetime &

trackpad-ctl enable

KEYMAP="${HOME}/.XKeymap-$(hostname)"
test -f ${KEYMAP} && xkbcomp ${KEYMAP} ${DISPLAY}

exec xmonad 2>&1 >| ${HOME}/.xmonad.log
