## Install libs ##
# Note it's probably a bad idea to just run this right now.

# download urls for macOs:
# https://www.iterm2.com/
# http://magicprefs.com
# http://www.psequel.com/

## Install Deps ##
if [[ "$OSTYPE" == "linux-gnu" ]]; then

  ## == GUI-only ==
  # Remap Caps to Escape
  dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

  # Remove home folder from desktop
  gsettings set org.gnome.shell.extensions.desktop-icons show-home false

  # Add chrome apt repo
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

  sudo apt update
  sudo apt install -y google-chrome-stable # For gui intalls only
  ## == /GUI-only ==

  # Add neovim repo
  sudo add-apt-repository ppa:neovim-ppa/stable

  # Install deps
  sudo apt update
  sudo apt install -y git zsh tmux curl neovim # Basics
  sudo apt install -y fonts-firacode 
  sudo apt install -y google-chrome-stable fonts-firacode # For gui intalls only
  sudo apt install -y python3-dev python3-pip # Python
  sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev # Ruby
  sudo apt install -y rlwrap leiningen # Clojure
  sudo apt install -y inotify-tools # Elixir
  sudo apt install -y postgresql postgresql-contrib libpq-dev # Postgres

  # Configure Neovim
  pip2 install --user neovim
  pip3 install --user neovim
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

  # Install asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.3

  sudo apt install -y automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev unzip curl

  # Install dracula for Ubuntu
  cd ~/repos
  git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula 
  cd gnome-terminal-colors-dracula
  ./install.sh 

  # Link VS Code Settings
  ln -s ~/repos/dotfiles/vscode/settings.json $HOME/.config/Code/User
  ln -s ~/repos/dotfiles/vscode/keybindings.json $HOME/.config/Code/User
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # VS Code
  rm $HOME/Library/Application\ Support/Code/User/settings.json
  rm $HOME/Library/Application\ Support/Code/User/keybindings.json
  ln -s ~/repos/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
  ln -s ~/repos/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
  # Repeat vim commands
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false 

  # Install key brew dependencies
  brew install asdf zsh vim wget 

  # Install all brew deps
  brew tap Homebrew/bundle
  brew bundle

  # Use brew shells
  sudo -s 
  echo /usr/local/bin/bash >> /etc/shells
  echo /usr/local/bin/zsh >> /etc/shells

  # Mac OSX
  pip3 install --user neovim
  defaults write com.apple.screencapture location ~/Downloads

  # Spectacle (window resizer)
  rm ~/Library/Application\ Support/Spectacle/Shortcuts.json 
  ln -s ~/repos/dotfiles/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 

  # Karabiner (keyboard)
  rm ~/.config/karabiner/karabiner.json 
  ln -s ~/repos/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json 

  # Install dracula iterm theme
  mkdir ~/.dracula
  # Clone the repo with colors
  git clone https://github.com/dracula/iterm.git ~/.dracula/iterm
  # iTerm2 > Preferences > Profiles > Colors Tab
  # Click Load Presets...
  # Click Import...
  # Select the Dracula.itermcolors file
  # Select the Dracula from Load Presets...
fi

# Set up oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Link dotfiles
mkdir ~/.vim
touch ~/.zshrc_private
rm ~/.zshrc
rm ~/.bashrc
ln -s ~/repos/dotfiles/ftplugin ~/.vim/
ln -s ~/repos/dotfiles/.zshrc ~
ln -s ~/repos/dotfiles/.bashrc ~
ln -s ~/repos/dotfiles/.bash_profile ~
ln -s ~/repos/dotfiles/.vimrc ~
ln -s ~/repos/dotfiles/.spacemacs ~
ln -s ~/repos/dotfiles/.ctags ~
ln -s ~/repos/dotfiles/.tmuxinator ~
ln -s ~/repos/dotfiles/.tmux.conf ~
ln -s ~/repos/dotfiles/.pryrc ~/
ln -s ~/repos/dotfiles/.gitignore ~/.gitignore_global
mkdir -p ~/.config/alacritty
ln -s ~/repos/dotfiles/alacritty.yml ~/.config/alacritty
# Link neovim config
mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Set up tmuxinator completion (won't work without a gem install, which is later.)
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -P ~/.bin/

# Install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install dracula zsh theme
git clone https://github.com/dracula/zsh.git ~/repos/tools/zsh-dracula
ln -s ~/repos/tools/zsh-dracula/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

# Set up gitignore
git config --global core.excludesfile ~/.gitignore_global
# make `git branch` not use the pager
git config --global pager.branch false 
# make `git push` always work
git config --global push.default current

# Languages
asdf plugin-add ruby
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add nodejs
asdf plugin-add java
asdf plugin-add clojure

# Ruby
asdf install ruby 2.7.0
asdf global ruby 2.7.0
gem install bundler rubocop

# Node
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring # Add node public keys
asdf install nodejs 14.15.5
asdf global nodejs 14.15.5
npm install --global yarn typescript eslint prettier

# Elixir
asdf install erlang 22.2 # This will take a while
asdf global erlang 22.2
asdf install elixir 1.10.2
asdf global elixir 1.10.2

# Finally, source zshrc
source ~/.zshrc
