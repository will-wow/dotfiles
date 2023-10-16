set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Add plugins here
" VIM
Plug 'tpope/vim-surround' " Surround thigns with braces and quotes
Plug 'tpope/vim-commentary' " Comment out stuff
Plug 'tpope/vim-projectionist' " Jumping around and running tests in projects
Plug 'tpope/vim-eunuch' " Rename and other shell commands
Plug 'michaeljsmith/vim-indent-object' " Add i as text object for indented blocks
Plug 'PeterRincker/vim-argumentative' " Add , as text object for arguments
Plug 'justinmk/vim-sneak' " s followed by two characters
Plug 'dracula/vim', {'as': 'dracula'} " Theme
Plug 'scrooloose/nerdtree' " File tree
Plug 'itchyny/lightline.vim' " Status line
Plug 'Raimondi/delimitMate' " Auto-close quotes
Plug 'haya14busa/incsearch.vim' " Highlight search results
Plug 'janko-m/vim-test' " Run tests with shortcuts
Plug 'benmills/vimux' " Pass tests from vim-test into a tmux pane
Plug 'jszakmeister/vim-togglecursor' " Make insert cursor a bar.
Plug 'christoomey/vim-tmux-navigator' " Tmux pane integration
Plug 'tmux-plugins/vim-tmux-focus-events' " Fix focusevent in tmux
Plug 'tmux-plugins/vim-tmux' " Tmux conf highlighting
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finderer bindings
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VSCode Extensions & Autocomplete
" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Elixir
Plug 'elixir-editors/vim-elixir'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails' " Projections and syntax highlighting for rails
" Plug 'tpope/vim-endwise' " add `end` to ruby and other code
Plug 'danchoi/ri.vim' " Ruby docs
" HTML
Plug 'othree/html5.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'alvan/vim-closetag'
" C
Plug 'Rip-Rip/clang_complete'
" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'
Plug 'Twinside/vim-hoogle'
" OTHER LANG
Plug 'sheerun/vim-polyglot' " Basic support for many languages

" All of your Plugins must be added before the following line
call plug#end()

" Put your non-Plugin stuff after this line

" Leader
let mapleader="\<Space>"

" Don't wait for esc.
set timeoutlen=1000 ttimeoutlen=10

" Color
syntax enable
set background=dark

let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

" Liteline
let g:lightline = {
\ 'colorscheme': 'dracula',
\   'active': {
\     'left': [ 
\       [ 'mode', 'paste' ],
\       [ 'filename', 'readonly', 'modified' ]
\     ],
\     'right': [ 
\       [ 'lineinfo' ],
\       [ 'cocstatus' ],
\     ]
\   },
\   'inactive': {
\     'left': [
\       [ 'relativepath', 'readonly', 'modified' ]
\     ]
\   },
\   'component_function': {
\     'cocstatus': 'coc#status'
\   },
\ }
set noshowmode " Don't show insert, since liteline already does

" Allow mouse selection and movement.
set mouse=a

" Search

" Project Serach (fzf)
nnoremap <leader>/ :Rg 
" Project Serach under cursor (fzf)
nnoremap <leader>* :Rg <c-r><c-w><cr>
" Search highlighted text.
vnoremap * y/<c-r>"<cr>
" Project search highlighted text.
vnoremap <leader>* y:Rg <c-r>"<cr>

" Open splits to the side as expected
set splitbelow
set splitright
" Horizontal split 
nnoremap <leader>w/ <c-w>v
" vertical split 
nnoremap <leader>w- <c-w>s
" Close split
nnoremap <leader>wd <c-w>c

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

" Smartcase for search
set ignorecase
set smartcase

" Smartcase for sneak
let g:sneak#use_ic_scs = 1

" delimitMate
" Make backspace work
set backspace=indent,eol,start
" Keep intent after completion
let g:delimitMate_expand_space = 1

" fzf
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>ff :History<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <C-P> :Commands<CR>
nnoremap <leader>: :Commands<CR>
nnoremap <leader>f/ :Lines<CR>

" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|priv/static\|build\|deps\|dist'

" Goto File mapping
nmap <leader>mgg gf
nmap <leader>mgG <c-w>f

" Buffer switching
" Swap to last buffer in split
nnoremap <leader><tab> <c-^>
" Close buffer and split
nnoremap <LEADER>bd :bdelete<CR>
nnoremap <LEADER>bd :bdelete<CR>
" next buffer.
nnoremap <LEADER>bn :bn<CR>
" Previous buffer
nnoremap <LEADER>bp :bp<CR> 
" Close a buffer without closing the split.
command! Bd bp|bd #

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
" Edit vimrc
nnoremap <leader>fed :e $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>feR :source $MYVIMRC<cr>

" Use system clipboard
set clipboard=unnamedplus

" Let <esc> turn off search highlighting
nnoremap <silent> <esc> :noh<return><esc>

" git
nnoremap <LEADER>gb :Gblame<CR>
nnoremap <LEADER>gd :Gdiff<CR>
nnoremap <LEADER>gs :GFiles?<CR>
nnoremap <LEADER>gc :Commits?<CR>
nnoremap <Leader>Td :GitGutterToggle<CR>

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
" Like :Delete, but keeps the now empty buffer.
nnoremap <leader>fD :Unlink<cr> 

" Turn off beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Autoread file updates
set autoread
au FocusGained * :checktime
nnoremap <leader>br :checktime

" I think this is for vimux?
:au FocusLost * silent! wa

" Markdown spellcheck
autocmd FileType markdown setlocal spell spelllang=en_us

" Wordcount
nnoremap <leader>wc g<c-g>

" Don't break in the middle of words
set linebreak

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

:source $HOME/repos/dotfiles/.vimrc_coc
