#!/usr/bin/env bash

# Mostly from https://github.com/stuartsierra/dotfiles

set -e

cd $(dirname $0)
export DOTFILES=$(pwd)

source $DOTFILES/install_functions.sh

update_submodules

link_with_backup .bashrc
link_with_backup .bash_profile
link_with_backup .gitconfig
link_with_backup .rvmrc
link_with_backup .tmux.conf

link_with_backup .emacs.d
install_elpa
link_with_backup .emacs
link_with_backup .emacs-custom.el

