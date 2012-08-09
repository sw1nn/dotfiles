alias lein='nocorrect lein'
alias rake="noglob rake"
alias ant="noglob ant"
alias emacs="emacsclient -a '' -ct"
alias ghb='nice -20 /opt/handbrake/bin/ghb'

setopt histignoredups
setopt histignorespace

ssh-reagent () {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        ssh-add -l 2>&1 > /dev/null
        if [ $? != 2 ]; then
            echo Found working SSH Agent:
            ssh-add -l
            return
        else 
            echo Found Old SSH Agent socket:
            rm -i $agent
        fi
    done
    
    unset SSH_AUTH_SOCK

    echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

zpo() {
    ssh -F ~/dotfiles/misc/foo_conf $@
}

opz() {
    scp -F ~/dotfiles/misc/foo_conf $@
}

alias opz='scp -F ~/dotfiles/misc/foo_conf'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
