# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [ -r ~/.zshrc ]; then echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zshrc; \
  else echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zprofile; fi


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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# -----------------------------------
# Terraform Aliases
# -----------------------------------
alias tf='terraform'
alias tfa='tf apply'
alias tfd='tf destroy --auto-approve'
alias tfi='tf init'
alias tfp='tf plan'
alias tfy='tf apply --auto-approve'

# -----------------------------------
# K8s Aliases
# -----------------------------------

alias k='kubectl'
alias kgp='k get pods'

# -----------------------------------
# Get Kubeconfig
# -----------------------------------

alias aks='aws eks --region us-east-1 update-kubeconfig --name'

export GOBIN=~/.local/bin
export PATH=$GOBIN:$PATH

export GPG_TTY=$(tty)


# format all the files touched

function tf_fmt() {
  directories=($(git status --short | cut -c 4- | cut -d' ' -f1 | sort -u | xargs -I{} dirname {}))

  for directory in "${directories[@]}"
  do
    echo "Processing directory: $directory"
    terraform fmt "$directory"
  done
}


#################
# TF DEBUG
#################

alias tfbug='export TF_LOG=DEBUG && export TF_LOG_PATH="./logs/debug.log" && export TF_LOG_SDK_PROTO_DATA_DIR="./logs/sdk_proto"'

alias tfrd='fq -d msgpack torepr'

#################
# Python
#################

alias penv='python3 -m venv .venv && source .venv/bin/activate'
function lolbanner() {
  figlet -c -f ~/.local/share/fonts/figlet-fonts/3d.flf $@ | lolcat
}
