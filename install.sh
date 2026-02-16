#!/usr/bin/env bash

set -e

mkdir -p ~/.config

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
