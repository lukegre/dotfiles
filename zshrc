# Homebrew env first
eval "$(/opt/homebrew/bin/brew shellenv)"

export KUBECONFIG="$HOME/.kube/config"

# Keep PATH unique and controlled
typeset -U path
path=(
  $HOME/.local/bin
  $HOME/.runai/bin
  /usr/local/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /System/Cryptexes/App/usr/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin
  /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin
  /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
)


# Make sure Homebrew site-functions are visible (docker, etc.)
fpath=(
  /opt/homebrew/share/zsh/site-functions 
  $HOME/.docker/completions
  $fpath
)

autoload -Uz compinit
compinit -C

# this line still creates an error - suppress output to null
source <($HOME/.runai/bin/runai completion zsh) &> /dev/null

# If your aliases file contains compdef or completion stuff, keep it after compinit too
source ~/.zsh_aliases

# Prompt (can be before or after; doesn’t matter for compdef)
eval "$(starship init zsh)"
