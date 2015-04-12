#!/usr/bin/env zsh

set -e

export DOTFILES="${0:h}"
export LOGFILE="${DOTFILES}/install-$(date +'%Y%m%d%H%M%S').log"

exec > >(tee ${LOGFILE})
exec 2>&1

. "${DOTFILES}/install_functions.sh"

cecho "green" "Updating git submodules..."
update_submodules

ln -s ${DOTFILES}/submodule/prezto ${HOME}/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


cecho "blue" "Linking dotfiles..."
ls -A | grep -e  "^\." | grep -v "^\.git$" |grep -v ".gitmodules" | while read dotfile
do
    link_with_backup "${dotfile}" >> ${LOGFILE}
done



cecho "yellow" "Installing Emacs packages..."
/usr/bin/emacs -l ${DOTFILES}/.emacs.d/init.el

cecho "cyan" "Installing local bin"
mkdir -p ~/bin

cecho "Finished, log is at ${LOGFILE} ..."
