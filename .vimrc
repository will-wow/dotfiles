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
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'ervandew/supertab'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-go'
  let g:deoplete#enable_at_startup = 1
else
  Plugin 'Shougo/neocomplete'
endif

" GIT
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
" ELIXIR
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'thinca/vim-ref'
" JS/TS
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'jason0x43/vim-js-indent'
Plugin 'helino/vim-json'
" HTML
Plugin 'othree/html5.vim'
Plugin 'Quramy/vim-js-pretty-template'
" C
Plugin 'Rip-Rip/clang_complete'
" Go
Plugin 'fatih/vim-go'
" OTHER LANG
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
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
nnoremap <leader>/ :Ack 
nnoremap <leader>* :silent execute "Ack " . shellescape(expand("<cword>"))<cr>

" Open splits to the side as expected
set splitbelow
set splitright
" Pipe for vertical split 
nnoremap <leader>wv <c-w>v
nnoremap <leader>ws <c-w>s
nnoremap <leader>wc <c-w>c
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l

" ctrlp
let g:ctrlp_map = '<leader>pf'
nnoremap <LEADER>ff :CtrlPCurFile<CR>
nnoremap <LEADER>fr :CtrlPMRU<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline bufferline
" let g:airline#extensions#tabline#enabled = 1

" Buffer switching
nnoremap <leader><tab> <c-^>
nnoremap <LEADER>bb :buffers<CR>
nnoremap <LEADER>bd :bdelete<CR>
nnoremap <LEADER>bn :bn<CR>
nnoremap <LEADER>bp :bp<CR>
nnoremap <LEADER>bR :e<CR>

" Nerdtree
nnoremap <leader>pt :NERDTreeToggle<CR>

" Line numbers: absolute # on active line, relative everywhere else
set number

" tabs: 2 spaces
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

" vimrc
nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>feR :so $MYVIMRC<cr>

" Use system clipboard
set clipboard=unnamedplus

" Let <esc> turn off search highlighting
nnoremap <silent> <esc> :noh<return><esc>

" Commentary
nmap <Leader>;  <Plug>Commentary
nmap <Leader>;; <Plug>CommentaryLine
omap <Leader>;  <Plug>Commentary
vmap <Leader>;  <Plug>Commentary

" easymotion
map <leader>j <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>jj <Plug>(easymotion-bd-f)
nmap <Leader>jj <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>jJ <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

" git
nnoremap <LEADER>gb :Gblame<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gs :Gstatus<CR>
nnoremap <Leader>Td :GitGutterToggle<CR>

" supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabCrMapping=1
let g:SuperTabMappingForward = "<c-j>"
let g:SuperTabMappingBackward = "<c-k>"

" OS-specific
if has('unix')
  if has('mac')
    " osx
    let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
  else
    " linux, bsd, etc
  endif
elseif has('win32') || has('win64')
  " Windows
endif
