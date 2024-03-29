# Configure terminal
export TERM="xterm-256color"
export LANG="en_US.UTF-8"

# Enable completions
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# Editor
export EDITOR="vim"
export VISUAL="${EDITOR}"


# Enable Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Language env
for _envtool in "pyenv"; do
  if command -v "${_envtool}" > /dev/null 2>&1; then
    eval "$(${_envtool} init --path)"
  fi
done
for _envtool in "goenv" "jenv" "nodenv" "rbenv"; do
  if command -v "${_envtool}" > /dev/null 2>&1; then
    eval "$(${_envtool} init -)"
  fi
done

# Add ~/.local/bin to PATH
export PATH="~/.local/bin:${PATH}"

# Homebrew configs
export HOMEBREW_NO_AUTO_UPDATE=1

# starship on launch
eval "$(starship init zsh)"

# -----------------------------------
# Git Aliases
# -----------------------------------
alias ga='git add'
alias gaa='git add .'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main'
alias gd='git diff'
alias gp='git pull'
alias gpu='git push'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gcl='git clean -fxfd'

