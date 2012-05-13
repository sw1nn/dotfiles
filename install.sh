#!/usr/bin/env bash

# Mostly from https://github.com/stuartsierra/dotfiles

set -e

cd $(dirname $0)
export DOTFILES="$(pwd)"
export LOGFILE="${DOTFILES}/install-$(date +'%Y%m%d%H%M%S').log"

. "${DOTFILES}/install_functions.sh"

# do this before linking .ssh, cos might lose required keys in that
# dir otherwise
cecho "green" "Updating git submodules..."
update_submodules 2>&1  >> "${LOGFILE}"

cecho "blue" "Linking dotfiles..."
ls -A | grep -e  "^\." | grep -v "^\.git$" |grep -v ".gitmodules" | while read dotfile
do
    link_with_backup "${dotfile}" >> ${LOGFILE}
done

cecho "magenta" "Sourcing os specific stuff, just in case"
. ~/.bashrc-os-specfic

cecho "yellow" "Installing ELPA packages..."
(install_elpa) 2>&1 >> "${LOGFILE}"

cecho "cyan" "Installing local bin"
mkdir -p ~/bin
ln -sf "${DOTFILES}/vimpager/vimpager" ~/bin/

read -p "Finished, review log file? [nY]" yes

if [ "${yes}" = "Y" -o -z "${yes}" ]; then
    less "${LOGFILE}"
fi    