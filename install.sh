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

# Ensure bash login shells source .bashrc
if [ ! -f "$HOME/.bash_profile" ] || ! grep -q 'bashrc' "$HOME/.bash_profile"; then
    echo '[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"' >> "$HOME/.bash_profile"
    echo "  Updated .bash_profile to source .bashrc"
fi

# Starship
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"
echo "  Linked starship.toml"

echo "Done. Restart your shell or run: source ~/.zshrc"
