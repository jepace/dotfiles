#!/bin/sh
#/usr/local/bin/gnome-session
case "$OSTYPE" in
	freebsd*)
		BINDIR="/usr/local/bin"
		;;
	linux*)
		BINDIR="/usr/bin"
		;;
	*)
		# xrdp based chain on WSL / Ubuntu doesn't come in with
		# OSTYPE..
		BINDIR="/usr/bin"
		;;
esac

[ -f $BINDIR/urxvt ] && export TERMINAL="$BINDIR/urxvt"
exec $BINDIR/ssh-agent $BINDIR/i3
