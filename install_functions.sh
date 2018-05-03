# mostly from https://github.com/stuartsierra/dotfiles/

function _echorun {
   echo $@
   eval $@
}

function cecho {
    if [ "${1}" = "-n" ] ; then
        nocr=1;
        shift
    fi

    case $1 in
      red) color='\033[31m' ;;
      green) color='\033[32m' ;;
      yellow) color='\033[33m' ;;
      blue) color='\033[34m' ;;
      magenta) color='\033[35m' ;;
      cyan) color='\033[36m' ;;
      grey) color='\033[37m' ;;
    esac  
    text=$2

    if [ -z "${nocr}" ] ;then
        echo -e "${color}${text}\033[0m"
    else
        echo -n -e "${color}${text}\033[0m"
    fi
}

function backup {
    local FILE="${1#./}"
    if [ -L "${FILE}" ]; then
        rm "${FILE}"
    elif [ -e "${FILE}" ]; then
        _echorun mv "${FILE}" "${FILE}.bak"
    fi
}

function link_with_backup {
    local FILENAME="${1#./}"
    local SOURCE="${DOTFILES}/${FILENAME}"
    local TARGET="${HOME}/${FILENAME}"
    if [ -e "${TARGET}" ]; then
        backup "${TARGET}"
    fi    
    echo ln -s "${SOURCE}" "${TARGET}"
}

function install_elpa {
    rm -rf "${DOTFILES}/.emacs.d/elpa"
    _echorun emacs --script "${DOTFILES}/load-elpa-packages.el" || cecho "Problem running emacs. Not installed?"
}

function update_submodules {
    git submodule init
    git submodule update
}
