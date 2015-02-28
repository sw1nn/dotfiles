#!/usr/bin/env bash

# Mostly from https://github.com/stuartsierra/dotfiles

set -e

cd $(dirname $0)
export DOTFILES="$(pwd)"
export LOGFILE="${DOTFILES}/install-$(date +'%Y%m%d%H%M%S').log"

. "${DOTFILES}/install_functions.sh"

cecho "green" "Updating git submodules..."
update_submodules 2>&1  >> "${LOGFILE}"

cecho "blue" "Linking dotfiles..."
ls -A | grep -e  "^\." | grep -v "^\.git$" |grep -v ".gitmodules" | while read dotfile
do
    link_with_backup "${dotfile}" >> ${LOGFILE}
done

cecho "yellow" "Installing ELPA packages..."
(install_elpa) 2>&1 >> "${LOGFILE}"

cecho "cyan" "Installing local bin"
mkdir -p ~/bin
ln -sf "${DOTFILES}/vimpager/vimpager" ~/bin/

cecho "Finished, log is at ${LOGFILE} ..."
