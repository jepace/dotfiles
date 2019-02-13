# .bashrc
# $Id: $

# bashrc is used for non-login interactive shells
echo "Processing ~/.bashrc..."

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
[[ -x /usr/local/bin/most ]] && export PAGER="`which most`"

set colored-stats="on"
cd ~

peek() { tmux split-window -p 33 "$EDITOR" "$@" || exit; }
tman () { tmux split-window -h -p 40 "man" -P $PAGER "$@" || exit; }

