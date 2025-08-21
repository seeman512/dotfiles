#!/usr/bin/env bash

dirs=(
	tmux
	vim
	neovim
	polybar
	notion
	xxkb
)

for d in ${dirs[*]}
do
	stow -v -t ~/ -S $d
done
