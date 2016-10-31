# Link dotfiles
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.spacemacs ~
source ~/.zshrc

# Link neovim config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
