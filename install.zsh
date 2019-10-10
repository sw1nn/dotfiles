#!/usr/bin/env zsh

set -e

export DOTFILES=$(readlink -f "${0:h}")
export LOGFILE="${DOTFILES}/install-$(date +'%Y%m%d%H%M%S').log"

exec > >(tee ${LOGFILE})
exec 2>&1

. "${DOTFILES}/install_functions.sh"

cd "${DOTFILES}"

cecho "green" "Updating git submodules..."
update_submodules

ln -sf ${DOTFILES}/submodule/prezto ${HOME}/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


cecho "blue" "Linking dotfiles..."
ls -A ${DOTFILES}/.*(.) | grep -v ".gitmodules" | while read dotfile
do
    link_with_backup "${dotfile}"
done

cecho "blue" "Linking dotfile directories..."
for dotdir in ${DOTFILES}/.*(/)
do
    ln -sf "${dotdir}" ${HOME}
done

cecho "cyan" "Installing local bin"
mkdir -p ~/.local/bin
for binfile in  ${DOTFILES}/bin/*(x)
do
    ln -sf ${binfile} ~/.local/bin/
done

cecho "Finished, log is at ${LOGFILE} ..."
