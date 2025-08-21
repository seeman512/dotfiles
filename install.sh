#!/usr/bin/env bash

dirs=(
	tmux
	vim
	neovim
)

for d in ${dirs[*]}
do
	stow -v -t ~/ -S $d
done
