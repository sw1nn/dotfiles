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
      red) color='\e[31m' ;;
      green) color='\e[32m' ;;
      yellow) color='\e[33m' ;;
      blue) color='\e[34m' ;;
      magenta) color='\e[35m' ;;
      cyan) color='\e[36m' ;;
      grey) color='\e[37m' ;;
    esac  
    text=$2

    if [ -z "${nocr}" ] ;then
        echo -e "${color}${text}\e[0m"
    else
        echo -n -e "${color}${text}\e[0m"
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
    _echorun ln -s "${SOURCE}" "${TARGET}"
}

function install_elpa {
    rm -rf "${DOTFILES}/.emacs.d/elpa"
    emacs --script "${DOTFILES}/load-elpa-packages.el"
}

function update_submodules {
    git submodule init
    git submodule update
}
