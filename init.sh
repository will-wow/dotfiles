## Install libs ##
# Note it's probably a bad idea to just run this right now.

# download urls:
# https://www.iterm2.com/
# http://magicprefs.com
# http://www.psequel.com/

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update system stuff
brew install git
brew install wget
brew install bash
brew install zsh
sudo -s 
echo /usr/local/bin/bash >> /etc/shells
echo /usr/local/bin/zsh >> /etc/shells

# Install dracula zsh theme
wget https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -O ~/.oh-my-zsh/themes/dracula.zsh-theme

# Install dracula iterm theme
wget https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors -O ~/.dracula/iterm.git
# iTerm2 > Preferences > Profiles > Colors Tab
# Click Load Presets...
# Click Import...
# Select the Dracula.itermcolors file
# Select the Dracula from Load Presets...

# Install postgres
brew install postgres
brew services start postgresql

# Set up oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
rm ~/.zshrc

# install neovim
brew tap neovim/neovim
brew install neovim

# tmux
brew install tmux
gem install tmuxinator

# Link dotfiles
ln -s ~/repos/dotfiles/.zshrc ~
ln -s ~/repos/dotfiles/.vimrc ~
ln -s ~/repos/dotfiles/.spacemacs ~
ln -s ~/repos/dotfiles/.ctags ~

# Link neovim config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Set up nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
# Install latest node
nvm install --lts
# Install avn for auto switching
npm install -g avn avn-nvm
avn setup
# Install useful node globals
npm install -g tern typescript tslint typescript-formatter jshint

## Set up Ruby ##
# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

## OS-Specific ##
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Chrome
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update
  sudo apt-get install google-chrome-stable
  # xmonad
  sudo apt-get install xmonad suckless-tools
  # ctags
  sudo apt-get install exuberant-ctags

  # For phoenix watch.
  sudo apt-get install inotify-tools
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  brew install cmake
  brew install python3
  pip3 install --user neovim
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
