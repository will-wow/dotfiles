## Install libs ##
# Note it's probably a bad idea to just run this right now.

# download urls for macOs:
# https://www.iterm2.com/
# http://magicprefs.com
# http://www.psequel.com/

## Install Deps ##
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Remap Caps to Escape
  dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

  # Add apt repos
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo add-apt-repository ppa:neovim-ppa/stable
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

  # Install deps
  sudo apt update
  sudo apt install -y google-chrome-stable fonts-hack-ttf # For gui intalls only
  sudo apt install -y git zsh tmux curl neovim python-dev python-pip python3-dev python3-pip
  sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev # Ruby
  sudo apt install -y inotify-tools # Elixir
  sudo apt install -y postgresql postgresql-contrib # Postgres

  # Configure Neovim
  pip2 install --user neovim
  pip3 install --user neovim
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

  # Install asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.3

  sudo apt install -y \
    automake autoconf libreadline-dev \
    libncurses-dev libssl-dev libyaml-dev \
    libxslt-dev libffi-dev libtool unixodbc-dev \
    unzip curl

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

  # Install brew deps
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
  ln -s ~/repos/dotfiles/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 

  # Install dracula iterm theme
  wget https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors -O ~/.dracula/iterm.git
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
ln -s ~/repos/dotfiles/.vimrc ~
ln -s ~/repos/dotfiles/.spacemacs ~
ln -s ~/repos/dotfiles/.ctags ~
ln -s ~/repos/dotfiles/.tmuxinator ~
ln -s ~/repos/dotfiles/.tmux.conf ~
ln -s ~/repos/dotfiles/.tmux-osx.conf ~
ln -s ~/repos/dotfiles/.tmux-linux.conf ~
ln -s ~/repos/dotfiles/.pryrc ~/
ln -s ~/repos/dotfiles/.gitignore ~/.gitignore_global
# Link neovim config
mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install dracula zsh theme
wget https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -O ~/.oh-my-zsh/themes/dracula.zsh-theme

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

# Set up Ruby before tmuxinator
asdf install ruby 2.6.3
asdf global ruby 2.6.3
gem install bundler rubocop

# tmux
gem install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -P ~/.bin/

# Node
asdf install nodejs 12.6.0
asdf global nodejs 12.6.0
npm install --global yarn typescript eslint prettier

# Elixir
asdf install erlang 22.07 # This will take a while
asdf global erlang 22.07
asdf install elixir 1.9.1
asdf global elixir 1.9.1

# Finally, source zshrc
source ~/.zshrc
