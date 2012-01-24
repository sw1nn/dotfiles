#!/usr/bin/env bash

# Mostly from https://github.com/stuartsierra/dotfiles

set -e

cd $(dirname $0)
export DOTFILES="$(pwd)"
export LOGFILE="${DOTFILES}/install-$(date +'%Y%m%d%H%M%S').log"

. "${DOTFILES}/install_functions.sh"

cecho "blue" "Linking dotfiles..."
ls -A | grep -e  "^\." | grep -v "^\.git$" | while read dotfile
do
    link_with_backup "${dotfile}" >> ${LOGFILE}
done

cecho "magenta" "Sourcing os specific stuff, just in case"
. ~/.bashrc-os-specfic

cecho "green" "Updating git submodules..."
update_submodules 2>&1  >> "${LOGFILE}"

cecho "yellow" "Installing ELPA packages..."
(install_elpa) 2>&1 >> "${LOGFILE}"

read -p "Finished, review log file? [nY]" yes
if [ "${yes}" = "Y" -o -z "${yes}" ]; then
    less "${LOGFILE}"
fi    
