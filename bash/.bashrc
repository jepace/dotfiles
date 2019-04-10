# .bashrc
# $Id: $

# bashrc is used for non-login interactive shells
echo "Processing ~/.bashrc..."

PATH=$PATH:~/usr/bin

# Colors chart: https://linuxconfig.org/bash-prompt-basics
# XXX: Using escape sequences caused problems, so redditor
# /u/raghuvrao helped me out.
# Also referred me to terminfo(1) and bash / Prompting
# PS1="\h [\u:\e[00;36m\w\e[00m]\$ "  - broke things!
# export SUDO_PS1='\h [\u:\[\e[00;36m\]\w\[\e[00m\]]\$ '

# FIX 1:
PS1='\h [\u:\[\e[00;36m\]\w\[\e[00m\]]\$ '
export SUDO_PS1='\h [\u:\[\e[00;36m\]\w\[\e[00m\]]\$ '

# TODO: FIX 2 [better, but not working]:
# cyan_fg="$(tput setaf 6 2>/dev/null)"
# reset="$(tput sgr0 2>/dev/null)"
# PS1='\h [\u:'"\[${cyan_fg}\]"'\w'"\[${reset}\]"']\$ '
# unset -v cyan_fg reset

set -o vi

# Bash-completion
[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
    source /usr/local/share/bash-completion/bash_completion.sh

# OS specific settings
case "$OSTYPE" in
    freebsd*) 
        echo "FreeBSD"
        LSflags="-FGIah"
        ;;
    solaris*)
        echo "SOLARIS"
        ;;
    darwin*)
        echo "OSX"
        ;;
    linux-gnu*)
        echo "LINUX"
        LSflags="-FGAhf --color=auto"
        ;;
    cygwin)
        echo "Cygwin"
        ;;
    *)
        echo "unknown: $OSTYPE"
        ;;
esac

alias vi="vim"
alias df="df -H"
alias c="clear"
alias x="exit"
alias cdc="cd; clear"
alias mroe="more"
alias tty-clock="tty-clock -x -c -C 6 -t -B"
alias psa="ps -auxww"
alias nif="sudo service netif restart"
alias feh="feh --output-dir ~/Downloads/Pictures/feh/ --scale-down "
alias t="task"

# ls customization
export LSCOLORS="gxfxcxdxbxegedabagacad"
alias ls="ls $LSflags"
alias ll="ls -l $LSflags"

export EDITOR="`which vim`"
export PAGER="`which less`"

set colored-stats="on"
cd ~

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

peek() { tmux split-window -p 33 "$EDITOR" "$@" || exit; }
tman () { tmux split-window -h -p 40 "man" "$@" || exit; }

# TODO: Make this better and more automatic
# Bring in fzf completions
[ -f ~/.bash/completion.bash ] && \
    source ~/.bash/completion.bash
[ -f ~/.bash/key-bindings.bash ] && \
    source ~/.bash/key-bindings.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Taskwarrior
[ -f ~/.bash/task.sh ] && source ~/.bash/task.sh


eval $(thefuck --alias)
