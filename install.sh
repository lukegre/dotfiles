#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"

echo "Installing dotfiles from $DOTFILES"

mkdir -p "$HOME/.config"

# Zsh
ln -sf "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
echo "  Linked .zshrc"

# Bash
ln -sf "$DOTFILES/bash/bashrc" "$HOME/.bashrc"
echo "  Linked .bashrc"

ln -sf "$DOTFILES/bash/bash_profile" "$HOME/.bash_profile"
echo "  Linked .bash_profile"

# Starship
mkdir -p "$HOME/.local/bin"
curl -sS https://starship.rs/install.sh | sh -s -- --force -b "$HOME/.local/bin"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"
echo "  Linked starship.toml"

# Git global ignore
mkdir -p "$HOME/.config/git"
ln -sf "$DOTFILES/git/gitignore_global" "$HOME/.config/git/ignore"
echo "  Linked gitignore_global"

# Readline (inputrc)
ln -sf "$DOTFILES/bash/inputrc" "$HOME/.inputrc"
echo "  Linked .inputrc"

echo "Done. Restart your shell or run: source ~/.zshrc"
