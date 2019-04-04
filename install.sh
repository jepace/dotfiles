#!/bin/sh
#set -x

DOTFILES=~/dotfiles/

cd $DOTFILES
for dir in *
do
	[ -d $dir ] || continue
	echo $dir
	stow $dir
done
