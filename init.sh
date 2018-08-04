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
  sudo apt install -y git zsh tmux curl google-chrome-stable neovim python-dev python-pip python3-dev python3-pip fonts-hack-ttf
  sudo apt install postgresql postgresql-contrib # Postgres
  sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev # Ruby
  sudo apt install -y esl-erlang inotify-tools # Elixir
  rm erlang-solutions_1.0_all.deb

  # Configure Neovim
  pip2 install --user neovim
  pip3 install --user neovim
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

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

## Set up Ruby ##
# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src && cd ~
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.5.1
rbenv global 2.5.1
gem install bundler rubocop

# tmux
gem install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -P ~/.bin/

# Install Elixir from source
cd ~/repos
git clone https://github.com/elixir-lang/elixir.git
cd elixir
make clean test
# Set up Elixir-LS
cd ~/repos
git clone git@github.com:JakeBecker/elixir-ls.git
cd elixir-ls
mix deps.get
mix elixir_ls.release -o lsp
echo "env ERL_LIBS=$ERL_LIBS:$HOME/repos/elixir-ls/lsp mix elixir_ls.language_server" | sudo tee /opt/ex-ls

# Set up nvm
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# Load nvm for the first time
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Install latest node
nvm install --lts
nvm alias default node
# Install yarn
npm install --global yarn
# Install avn for auto switching
# npm install --global add avn avn-nvm
# avn setup
# Install useful node globals
npm install --global tern typescript tslint eslint prettier create-react-app

## Haskell ##
# stack install hlint ghc-mod hindent

# Finally, source zshrc
source ~/.zshrc
