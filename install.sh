#!/bin/sh


EMACS_VERSION=26.2

set -eu

[ "${1:-}" = "-v" ] && set -x

echo $PWD

build_dir=$(mktemp -d)
trap "rm -rf ${build_dir}" EXIT QUIT TERM
PREFIX=${HOME}/.local
export PREFIX

if [ "$(hostname -s)" = "eridani" ]; then

        echo "Installing Packages..."
        sudo apt-get update -y
        sudo apt-get install -y \
             zsh \
             libncurses5-dev \
             automake \
             autoconf \
             make \
             aspell-en \
             libgnutls28-dev \
             gcc \
             libpng-dev \
             libjpeg-dev \
             libtiff5-dev \
             dnsutils \
             fuse \
             openvpn \
             imagemagick \
	     python3-venv \
	     cython3 \
	     python3-numpy \
	     python3-tk \
	     jq

        (
          cd ${build_dir}
          [ ! -f ${PREFIX}/bin/emacs ] &&
          (
            echo "Building Emacs..."
            curl -L http://ftp.gnu.org/gnu/emacs/emacs-${EMACS_VERSION}.tar.xz | tar xJf -

            cd emacs-${EMACS_VERSION}
            ./autogen.sh && ./configure --prefix=${PREFIX} --without-x && make install
          )

          [ ! -f ${PREFIX}/bin/fasd ] &&
          (
            echo "Building fasd..."
            curl -L https://github.com/clvv/fasd/tarball/1.0.1 | tar xzf -
            cd clvv-fasd-4822024
            PREFIX=${PREFIX} make install
          )

          systemctl --user link ~/.local/lib/systemd/user/emacs.service
          systemctl --user daemon-reload
          systemctl --user enable --now emacs
        )
fi

./install.zsh
