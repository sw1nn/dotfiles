# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/submodule/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="neale"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export HIST_IGNORE_ALL_DUPS=true
export JAVA_OPTS="-Dfile.encoding=UTF-8 -Dslime.encoding=UTF-8 -Xmx4096m -XX:+HeapDumpOnOutOfMemoryError"

if [[ "$SSH_CLIENT" =~ "205\.228\.82\.139.*" ]] ; then
    export POWERLINE_SYMBOLS=compatible
else
    export POWERLINE_SYMBOLS=fancy
fi

if [ -f ${HOME}/.mintty-solarized-dark ] ; then
    source ${HOME}/.mintty-solarized-dark
fi

alias ghb='nice -20 /opt/handbrake/bin/ghb'

function goo() {
    links "http://www.google.co.uk/search?q=$*"
}
export PATH=${HOME}/bin:${PATH}
