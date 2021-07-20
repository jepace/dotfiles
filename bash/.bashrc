# .bashrc

# bashrc is used for non-login interactive shells
echo "Processing ~/.bashrc..."

PATH=$PATH:~/usr/bin:~/go/bin:~/.local/bin

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

# OS specific settings
case "$OSTYPE" in
    freebsd*) 
        echo "FreeBSD"
        LSflags="-FGIash"
		alias nif="sudo service netif restart"
		alias df="df -H"
		alias psa="ps -auxww"
        ;;
	openbsd*)
		echo "OpenBSD"
		LSflags="-Fash"
		alias psa="ps -auxww"
		;;
	netbsd*)
		echo "NetBSD"
		LSflags="-Fash"
		alias psa="ps -auxww"
		# Ifconfig isn't in PATH already??
		PATH=$PATH:/sbin
		;;
    solaris*)
        echo "SOLARIS"
        ;;
    darwin*)
        echo "OSX"
        ;;
    linux-gnu*)
        echo "LINUX"
        LSflags="-FGAh --color=auto"
		alias psa="ps -ef"
        ;;
    cygwin)
        echo "Cygwin"
        ;;
    *)
        echo "unknown: $OSTYPE"
        ;;
esac

[ -x `which vim` ] && alias vi="vim"
alias c="clear"
alias x="exit"
alias cdc="cd; clear"
alias feh="feh --output-dir ~/Downloads/Pictures/feh/ --scale-down "
alias t="task"
[ -x `which tty-clock` ] && alias tty-clock="tty-clock -x -c -C 6 -t -B"

# ls customization
export LSCOLORS="gxfxcxdxbxegedabagacad"
alias ls="ls $LSflags"
alias ll="ls -l $LSflags"

export EDITOR="`which vim`"
export PAGER="`which less`"
alias mroe="more"

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

peek() { [ -z "${TMUX}" ] && tmux split-window -p 33 "$EDITOR" "$@" || "$EDITOR" "$@"; }
tman () { [ -z "${TMUX}" ] && tmux split-window -h -p 40 "man" "$@" || "man" "$@"; }

jagular() { [ -z "${TMUX}" ] && ssh jagular || tmux new-window -n jagular ssh jagular || exit; }
tigger() { [ -z "${TMUX}" ] && ssh tigger || tmux new-window -n tigger ssh tigger || exit; }

# History -- I should learn it...
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Load command line completions
[ -f /usr/local/share/bash-completion/bash_completion.sh ] && source /usr/local/share/bash-completion/bash_completion.sh

for i in ~/.bash/*
do
	[ -f $i ] && source $i
done

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#eval $(thefuck --alias)



##### .bashrc clean from ubuntu
# Steal ideas?

## ~/.bashrc: executed by bash(1) for non-login shells.
## see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
## for examples
#
## If not running interactively, don't do anything
#case $- in
#    *i*) ;;
#      *) return;;
#esac
#

## If set, the pattern "**" used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
##shopt -s globstar
#
## make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac
#
## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
##force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
#
## enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi
#
## colored GCC warnings and errors
##export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#
## some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
#
## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
## Alias definitions.
## You may want to put all your additions into a separate file like
## ~/.bash_aliases, instead of adding them here directly.
## See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi
#
## enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
