#!/usr/bin/env bash

# Install Homebrew
if test ! $(which brew); then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing system packages"
brew bundle install --file=Brewfile

brew cleanup

echo "Setuping neovim"
npm install -g neovim
pip install pynvim
pip3 install pynvim
stow nvim

echo "Stow other"

stow zsh

stow tmux

stow karabiner

stow broot

stow alacritty

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
