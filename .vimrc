set nocompatible              " be iMproved, required
filetype off                  " required

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add plugins here
" VIM
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'

" ELIXIR
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
" JS/TS
Plugin 'quramy/tsuquyomi'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jason0x43/vim-js-indent'
" HTML
Plugin 'othree/html5.vim'
" OTHER LANG
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Leader
let mapleader="\<Space>"

" Color
syntax enable
set background=dark
colorscheme solarized

" Use AG for serach if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Open splits to the side as expected
set splitbelow
set splitright
" Pipe for vertical split 
nnoremap <leader>w/ <c-w>v
nnoremap <leader>w- <c-w>S
nnoremap <leader>wd <c-w>c
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k

" ctrlp
let g:ctrlp_map = '<leader>pf'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline bufferline
let g:airline#extensions#tabline#enabled = 1

" Buffer switching
nnoremap <leader><tab> :bp<cr>

" Nerdtree
nnoremap <leader>pt :NERDTreeToggle<CR>

" Line numbers: absolute # on active line, relative everywhere else
set number
set relativenumber

" Tabs: 2 spaces
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab
