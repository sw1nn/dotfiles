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


if [ -f ${HOME}/.xflux-location ]; then
  source ${HOME}/.xflux-location
  xflux -l ${LATITUDE} -g ${LONGITUDE}
fi

xscreensaver &
volnoti &

exec i3  >& ~/.xsession.log
