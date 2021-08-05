# ==========
# Oh-My-Zsh
# ==========

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="dracula"

# For fzf plugin
export FZF_BASE=$HOME/.fzf

# ZSH Plugins
plugins=(git git-flow web-search vi-mode fzf)

# Oh-my-zsh
source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

# =====
# Path
# =====

export PATH="$HOME/.local/bin:/.local/bin/miniconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.config/yarn/global/node_modules/.bin:/home/wow/anaconda3/bin:/usr/local/cuda-9.1/bin:$PATH"
# Add repos to path
export PATH="$HOME/repos/bin:$PATH"
# Add local bin to path
export PATH="./bin:$PATH"
# Mongo 4
export PATH="/usr/local/opt/mongodb-community@4.0/bin:$PATH"
# Python poetry
export PATH="$HOME/.poetry/bin:$PATH"
# Flutter
export PATH="$HOME/tools/flutter/bin:$PATH"
# Dotfiles scripts
export PATH="$HOME/repos/dotfiles/bin:$PATH"

# ======
# Tools
# ======

# square brackets
unsetopt nomatch

# FZF Fuzzy Search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux
source ~/.bin/tmuxinator.zsh
alias mux=tmuxinator

# You may need to manually set your language environment
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ========
# Aliases
# ========

alias be='bundle exec'
alias gitdog='git log --decorate --oneline --graph'
alias gpf='git push --force-with-lease'
alias gcb='git checkout -b'
alias code.extensions.save='code --list-extensions | xargs -L 1 echo code --install-extension > $HOME/repos/dotfiles/vscode/extensions.sh && chmod 755 $HOME/repos/dotfiles/vscode/extensions.sh'
alias code.extensions.load='$HOME/repos/dotfiles/vscode/extensions.sh'
alias docker-nuke='docker container rm --force --volumes $(docker container ls --quiet --all) && docker network rm $(docker network ls -q)'

# Pomodoro timers
alias pom='termdown 25m && say done'
alias pom5='termdown 5m && say done'
alias pom3='termdown 2m && say done'

# ========
# Vi-mode
# ========

# Vi-mode indicator
export MODE_INDICATOR="%{$fg_bold[green]%}[NORMAL]%{$reset_color%}"

# Faster swtich to normal mode
export KEYTIMEOUT=1
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Beginning of line with _
bindkey -M vicmd "_" vi-beginning-of-line

# ==========
# Languages
# ==========

# asdf version manager

if [[ "$OSTYPE" == "darwin"* ]]; then
  . $(brew --prefix asdf)/asdf.sh
else
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

# Java
# export JAVA_HOME="/Library/Java/Home"
# . ~/.asdf/plugins/java/set-java-home.zsh
# Remember to symlink this to the right place

export GOPATH="$HOME/repos/go"
export PATH="$PATH:$GOPATH/bin"
export TOMCAT_HOME=/usr/local/Cellar/tomcat/8.5.15/libexec/

# OPAM (ocaml package managner) configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ============
# OS-specific
# ============

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Linux
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # SSH to linux
  elif grep -Fq "Microsoft" /proc/version; then
    # Windows Bash
  else
    # Normal lunux desktop
    if [ -x "$(command -v setxkbmap)" ]; then
      setxkbmap -option caps:escape
    fi
    eval `dircolors $HOME/.dir_colors/dircolors`
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  alias vi='nvim'
  alias vim='nvim'
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
  # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # ...
else
  # Unknown.
fi

# Alias private stuff
if [ -e "~/.zshrc_private" ]
then
  source ~/.zshrc_private
fi

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

eval "$(pdm --pep582)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wow/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wow/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wow/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wow/google-cloud-sdk/completion.zsh.inc'; fi
