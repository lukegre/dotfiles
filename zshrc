# Homebrew env first (may set PATH/MANPATH/INFOPATH)
eval "$(/opt/homebrew/bin/brew shellenv)"

autoload -Uz compinit
compinit -C
autoload -Uz colors
colors

export KUBECONFIG="$HOME/.kube/config"

# Keep PATH unique and controlled
typeset -U path
path=(
  $HOME/.local/bin
  $HOME/.runai/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /System/Cryptexes/App/usr/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin
  /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin
  /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
)

# Prompt
eval "$(starship init zsh)"

# Completions that use compdef must come after compinit
source <($HOME/.runai/bin/runai completion zsh)
source ~/.zsh_aliases


# ls colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LESS='-R'
alias grep='grep --color=auto'