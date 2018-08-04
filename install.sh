#!/bin/sh

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
        sudo apt-get install -y zsh libncurses5-dev automake autoconf make aspell-en libgnutls28-dev gcc libpng-dev libjpeg-dev libtiff5-dev
        (
          cd ${build_dir}
          (
            echo "Building Emacs..."
            curl -L http://ftp.gnu.org/gnu/emacs/emacs-26.1.tar.xz | tar xJf -

            cd emacs-26.1
            ./autogen.sh && ./configure --prefix=${PREFIX} && make install
          )

          (
            echo "Building fasd..."
            curl -L https://github.com/clvv/fasd/tarball/1.0.1 | tar xzf -
            cd clvv-fasd-4822024
            PREFIX=${PREFIX} make install
          )
        )
fi

./install.zsh
