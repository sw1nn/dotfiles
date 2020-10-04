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

# Source Prezto.
source ${HOME}/.zprofile

xrdb -load ${HOME}/.Xresources
xsetroot -xcf /usr/share/icons/Adwaita/cursors/top_left_arrow 16
feh --bg-max ~/backgrounds/default

exec lxsession 2>&1 >> ~/.lxsession.log
