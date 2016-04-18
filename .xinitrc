# Invoked from startup, we assume zsh.
#
# Source scripts in /etc/X11/xinit/xinitrc.d/

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

KEYMAP="${HOME}/.XKeymap-$(hostname -s)"
test -f ${KEYMAP} && xkbcomp ${KEYMAP} ${DISPLAY}

gpg-agent --daemon \
          --display "${DISPLAY}" \
          --keep-display

export SSH_AUTH_SOCK=/tmp/neale/ssh-agent.sock

# Source Prezto.
source ${HOME}/.zprofile

export _JAVA_AWT_WM_NONREPARENTING=1

xrdb -load ${HOME}/.Xresources
xsetroot -xcf /usr/share/icons/Adwaita/cursors/top_left_arrow 16

xrandr --output DVI-0
#xrandr --output DVI-1 --left-of DVI-0
#xrandr --output DisplayPort-0 --right-of DVI-0
xrandr --output HDMI-0 --right-of DVI-0
xrandr --output VGA-0 --left-of DVI-0 --rotate left --primary

if [ -f ${HOME}/.xflux-location ]; then
  source ${HOME}/.xflux-location
  xflux -l ${LATITUDE} -g ${LONGITUDE}
fi

xscreensaver &

exec i3  >& ~/.xsession.log
