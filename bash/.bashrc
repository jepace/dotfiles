# .bashrc
# $Id: $

# bashrc is used for non-login interactive shells
echo "Processing ~/.bashrc..."

# Colors chart: https://linuxconfig.org/bash-prompt-basics
PS1="\h [\u:\e[00;36m\w\e[00m]\$ " 
export SUDO_PS1="\h [\e[01;31m\u:\e[00;36m\w\e[00m]\$ " 

set -o vi

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
        LSflags="-FGah --color=auto"
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

# Bring in fzf completions
source ~/.bash/completion.bash
source ~/.bash/key-bindings.bash
