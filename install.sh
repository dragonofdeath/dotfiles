#!/usr/bin/env bash

echo "Setuping neovim"
npm install -g neovim
pip install pynvim
pip3 install pynvim

mkdir -p $HOME/.vim
stow nvim

echo "Stow other"

stow zsh

stow tmux

stow karabiner

stow broot

stow alacritty

stow git

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
