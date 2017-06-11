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
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-projectionist'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'haya14busa/incsearch.vim'
Plugin 'janko-m/vim-test'
Plugin 'ervandew/supertab'
Plugin 'benmills/vimux'
Plugin 'jszakmeister/vim-togglecursor' " Make insert cursor a bar.
Plugin 'christoomey/vim-tmux-navigator' " Tmux pane integration
Plugin 'vim-scripts/argtextobj.vim' " Argument text objects
Plugin 'bkad/CamelCaseMotion' " Word motions for camel/snake case
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-go'
  let g:deoplete#enable_at_startup = 1
else
  Plugin 'Shougo/neocomplete'
  let g:neocomplete#enable_at_startup = 1
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
" Plugin 'helino/vim-json'
Plugin 'mxw/vim-jsx' 
" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise' " add `end` to ruby and other code
Plugin 'danchoi/ri.vim' " Ruby docs
Plugin 'kana/vim-textobj-user' " Dep for ruby text objects
Plugin 'nelstrom/vim-textobj-rubyblock' " Ruby block text objects
" HTML
Plugin 'othree/html5.vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'alvan/vim-closetag'
" CoffeeScript
Plugin 'kchmck/vim-coffee-script'
Plugin 'AndrewRadev/vim-eco'
" C
Plugin 'Rip-Rip/clang_complete'
" Go
Plugin 'fatih/vim-go'
" Haskell
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'neovimhaskell/haskell-vim'
" Plugin 'alx741/vim-hindent'
Plugin 'Twinside/vim-hoogle'
" OTHER LANG
Plugin 'sheerun/vim-polyglot' " all the languages
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'w0rp/ale' " Linters
Plugin 'sbdchd/neoformat'

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

" Don't wait for esc.
set timeoutlen=1000 ttimeoutlen=10

" Color
syntax enable
set background=dark
" colorscheme solarized
colorscheme dracula

" Airline
let g:airline_powerline_fonts = 1
" Always show
set laststatus=2

" Ack
" Use AG for serach if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>/ :Ack!<Space>
nnoremap <leader>* :Ack! <c-r><c-w><cr>
vnoremap * y/<c-r>"<cr>
vnoremap <leader>* y:Ack! <c-r>"<cr>

nnoremap <leader>fs :w<CR>

" Open splits to the side as expected
set splitbelow
set splitright
" Pipe for vertical split 
nnoremap <leader>w/ <c-w>v
nnoremap <leader>w- <c-w>s
nnoremap <leader>wd <c-w>c
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l

" vim-test
let g:test#strategy = "vimux"
" mode test commands
nnoremap <leader>mtb :TestFile<cr>
nnoremap <leader>mtt :TestNearest<cr>
nnoremap <leader>mtl :TestLast<cr>
nnoremap <leader>mtv :TestVisit<cr>

" jk by visual line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" bash-y edit tab complete.
" set wildmode=longest,list

" Smartcase for search
set ignorecase
set smartcase

" delimitMate
" Make backspace work
set backspace=indent,eol,start
" Keep intent after completion
let g:delimitMate_expand_space = 1

" ctrlp
let g:ctrlp_map = '<leader>pf'
nnoremap <LEADER>ff :CtrlPCurFile<CR>
nnoremap <LEADER>fr :CtrlPMRU<CR>
nnoremap <LEADER>pc :CtrlPClearCache<CR>
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_match_current_file = 1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|priv/static\|build\|deps\|dist'
let g:ctrlp_show_hidden = 1

" Goto File mapping
nmap <leader>mgg gf
nmap <leader>mgG <c-w>f

" Buffer switching
nnoremap <leader><tab> <c-^>
nnoremap <LEADER>bb :CtrlPBuffer<CR>
nnoremap <LEADER>bd :bdelete<CR>
nnoremap <LEADER>bn :bn<CR>
nnoremap <LEADER>bp :bp<CR>

" Nerdtree
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp$', 'npm-debug.log.*$'] " Hide files.
let NERDTreeShowHidden=1 " Show hidden files.

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
nnoremap <leader>fer :w<cr>:so %:p<cr>

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
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCrMapping=1
" let g:SuperTabMappingForward = "<c-j>"
" let g:SuperTabMappingBackward = "<c-k>"
let g:SuperTabLongestHighlight = 1

" TS
let g:tsuquyomi_completion_detail = 1

" Alt
" Run a given vim command on the results of alt from a given path.
" See usage below.
" This can be used as an alternative to projectionist
" with :
"   nnoremap <leader>mt<tab> :w<cr>:call AltCommand(expand('%'), ':e')<cr>
"   nnoremap <leader>mtv :w<cr>:call AltCommand(expand('%'), ':vsp')<cr>
"   nnoremap <leader>mts :w<cr>:call AltCommand(expand('%'), ':sp')<cr>
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Projectionist commands
nnoremap <leader>mt<tab> :w<cr>:A<cr>
nnoremap <leader>mtv :w<cr>:AV<cr>
nnoremap <leader>mts :w<cr>:AS<cr>
nnoremap <leader>mtT :w<cr>:AT<cr>

" enunch
nnoremap <leader>fR :Rename<space>
nnoremap <leader>fD :Unlink<cr>

" Find and Replace
" nnoremap <leader>pr :Ack!<space> :cfdo s/thing/thang/gc<cr>

" Turn off beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Autoread file updates
set autoread
nnoremap <leader>br :checktime<cr>:CtrlPClearCache<cr>

" I think this is for vimux?
:au FocusLost * silent! wa

" Use <leader><TextObject> for CamelCaseMotion words
call camelcasemotion#CreateMotionMappings('<leader>')

" OS-specific
if has('unix')
  " Put backups somewhere outside of git
  if filewritable(expand('%:p:h')."\.") && !filewritable(expand('%:p:h').'\_backup')
    silent execute '!mkdir "'.expand('%:p:h').'\_backup"'
  endif
  set backupdir=./.backup,.,/tmp
  set directory=.,./.backup,/tmp

  if has('mac')
    " Fix issue with macOS backspace messing with tmux c-h
    if has('nvim')
      nmap <BS> <C-W>h
    endif
  else
    " linux, bsd, etc
  endif
elseif has('win32') || has('win64')
  " Windows
  silent execute '!mkdir "'.$HOME.'/tmp"'
  silent execute '!del "'.$HOME.'/tmp/*~"'
  set directory-=$HOME/tmp
  set directory^=$HOME/tmp//
  set backupdir-=$HOME/tmp
  set backupdir^=$HOME/tmp//

  " GUI options
  set guioptions -=m " Hide menubar
  set guioptions -=T " Hide toolbar
  " Download from https://github.com/chrissimpkins/Hack
  set guifont=Hack:h10 " Nice font
endif
