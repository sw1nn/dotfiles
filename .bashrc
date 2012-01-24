export EDITOR=/usr/bin/vim
export FIGNORE=.svn
export GLOBIGNORE=CVS:.svn
export FIGNORE="${GLOBIGNORE}"
export HISTCONTROL=erasedups

export GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto'


# function to truncate a string with ellipsis. There has to be a better way....
function truncatedir() {
    local trunc_symbol="...";
    local newdir;
    local olddir="$1";
    local dir_fudge_width="$2";
    local tty="$3";
    olddir=${olddir/$HOME/\~};
    [ -z $tty ] && tty=$(tty)
    local width=$(stty -f "$tty" size | cut -d' ' -f 2);
    dirmaxlen=$(( $width - dir_fudge_width ));
    if [ "${#olddir}" -gt $dirmaxlen ]
    then
        local pwdoffset=$(( ${#olddir} - $dirmaxlen));
        newdir="${trunc_symbol}${olddir:$pwdoffset:$dirmaxlen}";
    else
        newdir=${olddir};
     fi

     echo $newdir;
}

let prompt_fixed_len=${#USER}+${#HOSTNAME}+5;

function prompt_command() {
   promptPWD=$(truncatedir "$PWD" "$prompt_fixed_len"); 
}

function rjarfind() {
    local mytty=$(tty)
    find ${PWD} -name "*.jar" | while read j
    do
        winpath=$(cygpath --windows "$j")
        echo -e "\e[36m----------\e[35m $(truncatedir $j 25 $mytty) \e[36m----------\e[0m"
        ${JAVA_HOME_unix}/bin/jar tvf "$winpath" | grep $@
    done
}

function rgrep() {
    local cmd="find . -type f -exec grep $@ {} /dev/null ;"
    echo $cmd
    $cmd
}

ssh-reagent () {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        if ssh-add -l 2>&1 > /dev/null; then
            echo Found working SSH Agent:
            ssh-add -l
            return
        fi
    done
    
    unset SSH_AUTH_SOCK

    echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
    . /opt/local/etc/profile.d/autojump.sh
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -f ~/.git_completion.bash ]; then
    . ~/.git_completion.bash    
fi

export PROMPT_COMMAND=prompt_command
export PS1='\[\e]0;\w\a\n\e[32m\u\e[36m@\e[31m\h \e[33m${promptPWD}\e[0m\e[36m$(__git_ps1)\e[0m\]\n\$ '
export PAGER=vimpager 
export GIT_PAGER=less # vimpager filters color ;-)
alias less=$PAGER 
alias zless=$PAGER 

case $(uname) in
    "Darwin")
        export PATH="/opt/local/bin:/opt/local/sbin/:${PATH}"
        export PATH="/Developer/usr/bin:$PATH"
        export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
        export CLICOLOR=1 # turn on colorised ls
        ;;
    "cygwin")
        ;;
esac

export PATH="~/bin:${PATH}"

export HADOOP_HOME=/opt/local/share/java/hadoop-0.20.203.0

alias hadoop='hadoop-bin hadoop'
