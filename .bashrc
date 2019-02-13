# .bashrc
# $Id: $

# bashrc is used for non-login interactive shells
echo "Processing ~/.bashrc..."

peek() { split-window -p 33 "$EDITOR" "$@" || exit; }

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

# ls customization
export LSCOLORS="gxfxcxdxbxegedabagacad"
alias ls="ls $LSflags"
alias ll="ls -l $LSflags"

export EDITOR="`which vim`"

set colored-stats="on"
cd ~
