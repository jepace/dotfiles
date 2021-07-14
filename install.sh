#!/bin/sh
#set -x

DOTFILES=~/dotfiles/

cd $DOTFILES
for dir in *
do
	[ -d $dir ] || continue
	echo $dir
	# First clean it out
	stow -D $dir
	stow $dir
done
