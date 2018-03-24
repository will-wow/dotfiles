# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
ZSH_THEME="dracula"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow web-search vi-mode)

# User configuration

# Vi-mode indicator
export MODE_INDICATOR="%{$fg_bold[green]%}[NORMAL]%{$reset_color%}"

export PATH="$HOME/.local/bin:/.local/bin/miniconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Add local bin to path
export PATH="./bin:$PATH"

# Aliases
alias be='bundle exec'
alias gitdog='git log --decorate --oneline --graph'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
	
# square brackets
unsetopt nomatch

# tmux
source ~/.bin/tmuxinator.zsh

# Vi-mode
# Faster swtich to normal mode
export KEYTIMEOUT=1
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Beginning of line with _
bindkey -M vicmd "_" vi-beginning-of-line

# Elixir source install
export PATH="$PATH:$HOME/repos/elixir/bin"

export GOPATH="$HOME/repos/go"
export PATH="$PATH:$GOPATH/bin"
export TOMCAT_HOME=/usr/local/Cellar/tomcat/8.5.15/libexec/

# OS-specific stuff
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Linux
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # SSH to linux
  elif grep -Fq "Microsoft" /proc/version; then
    # Windows Bash
  else
    # Normal lunux desktop
    setxkbmap -option caps:escape
    eval `dircolors $HOME/.dir_colors/dircolors`
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  alias vi='nvim'
  alias vim='nvim'
  ssh-add -A

  # Setup QT brew link
  export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

  # Alias git = hub
  eval "$(hub alias -s)"
  alias gpr='git pull-request'
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
if [ ! -e "~/.zshrc_private" ]
then
  source ~/.zshrc_private
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
