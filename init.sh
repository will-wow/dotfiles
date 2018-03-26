## Install libs ##
# Note it's probably a bad idea to just run this right now.

# download urls:
# https://www.iterm2.com/
# http://magicprefs.com
# http://www.psequel.com/

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run Brew Bundle
brew tap Homebrew/bundle
brew bundle

# Ubuntu Installs
sudo apt update
sudo apt install zsh
sudo apt install tmux

# Use brew shells
sudo -s 
echo /usr/local/bin/bash >> /etc/shells
echo /usr/local/bin/zsh >> /etc/shells

# Set up oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
rm ~/.zshrc

# Install dracula zsh theme
wget https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -O ~/.oh-my-zsh/themes/dracula.zsh-theme

# Install dracula iterm theme
wget https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors -O ~/.dracula/iterm.git
# iTerm2 > Preferences > Profiles > Colors Tab
# Click Load Presets...
# Click Import...
# Select the Dracula.itermcolors file
# Select the Dracula from Load Presets...

# Install dracula for Ubuntu
cd ~/repos
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
cd gnome-terminal-colors-dracula
 ./install.sh 

# Set up gitignore
ln -s ~/repos/dotfiles/.gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# make `git branch` not use the pager
git config --global pager.branch false 

# make `git push` always work
git config --global push.default current

# Set up Elixir-LS
cd ~/repos
git clone git@github.com:JakeBecker/elixir-ls.git
cd elixir-ls
mix deps.get
mix release -o lsp
echo "env ERL_LIBS=$ERL_LIBS:$HOME/repos/elixir-ls/lsp mix elixir_ls.language_server" >  /opt/ex-ls

# Link dotfiles
mkdir ~/.vim
touch ~/.zshrc_private
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

# Link neovim config
mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Set up nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
# Install latest node
nvm install --lts
nvm alias default node
# Install yarn
npm install --global yarn
# Install avn for auto switching
yarn global add avn avn-nvm
avn setup
# Install useful node globals
yarn global add tern typescript tslint jshint eslint prettier create-react-app

## Set up Ruby ##
# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# For ubuntu install build-essential first
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.4.1
rbenv global 2.4.1
gem install bundler rubocop

# tmux
gem install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -P ~/.bin/

## Haskell ##
stack install hlint ghc-mod hindent

## OS-Specific ##
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Chrome
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update
  sudo apt-get install google-chrome-stable
  
  # Neovim
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt update
  sudo apt install neovim
  sudo apt install python-dev python-pip python3-dev python3-pip
  pip2 install --user neovim
  pip3 install --user neovim
  
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

  # Ruby deps
  sudo apt install build-essential
  apt-get install -y libssl-dev libreadline-dev zlib1g-dev

  # Elixir
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
  sudo apt update
  sudo apt install esl-erlang
  # See elixir-ls

  # For phoenix watch.
  sudo apt-get install inotify-tools

  # Link VS Code Settings
  ln -s ~/repos/dotfiles/vscode/settings.json /home/wow/.config/Code/User/settings.json

  # Install Hack
  sudo apt install fonts-hack-ttf

elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  pip3 install --user neovim
  defaults write com.apple.screencapture location ~/Downloads

  ln -s ~/repos/dotfiles/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 
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

# Install gocode for go autocomplete
go get -u github.com/nsf/gocode

# Finally, source zshrc
source ~/.zshrc
