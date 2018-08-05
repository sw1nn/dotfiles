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

#export _JAVA_AWT_WM_NONREPARENTING=1

xrdb -load ${HOME}/.Xresources
xsetroot -xcf /usr/share/icons/Adwaita/cursors/top_left_arrow 16

#/usr/bin/gpg-agent --enable-ssh-support --daemon 
#TERM=xterm-256color /usr/bin/zsh -i -c "/usr/bin/emacs -nw --daemon" &


if [ -f ${HOME}/.xflux-location ]; then
  source ${HOME}/.xflux-location
  xflux -l ${LATITUDE} -g ${LONGITUDE}
fi

systemctl --user show-environment >>| ~/.lxsession.log

exec lxsession 2>&1 >>| ~/.lxsession.log
