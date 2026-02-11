#!/usr/bin/env bash

set -e

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh_aliases ~/.zsh_aliases
mkdir -p ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

echo "Dotfiles installed."
