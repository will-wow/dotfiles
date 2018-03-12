set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Add plugins here
" VIM
Plug 'tpope/vim-surround' " Surround thigns with braces and quotes
Plug 'tpope/vim-commentary' " Comment out stuff
Plug 'tpope/vim-eunuch' " UNIX shell commands
Plug 'tpope/vim-projectionist' " Jumping around and running tests in projects
Plug 'michaeljsmith/vim-indent-object' " Add i as text object for indented blocks
Plug 'PeterRincker/vim-argumentative' " Add , as text object for arguments
Plug 'bkad/CamelCaseMotion' " Add <space>w/b as text object for camel/snake words
Plug 'tommcdo/vim-exchange' " cx{motion} to swap text
Plug 'dracula/vim' " Theme
Plug 'scrooloose/nerdtree' " File tree
Plug 'itchyny/lightline.vim' " Status line
Plug 'Raimondi/delimitMate' " Auto-close quotes
Plug 'haya14busa/incsearch.vim' " Highlight search results
Plug 'janko-m/vim-test' " Run tests with shortcuts
Plug 'benmills/vimux' " Pass tests from vim-test into a tmux pane
Plug 'ervandew/supertab' " Use tab for completion
Plug 'jszakmeister/vim-togglecursor' " Make insert cursor a bar.
Plug 'christoomey/vim-tmux-navigator' " Tmux pane integration
Plug 'tmux-plugins/vim-tmux-focus-events' " Fix focusevent in tmux
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finderer bindings
if has('nvim')
  " Language Server
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'roxma/nvim-completion-manager' " Autocomplete
endif
" Runners
Plug 'w0rp/ale' " Runs linters & fixers
" Elixir
Plug 'elixir-editors/vim-elixir'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" JS/TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx' 
" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails' " Projections and syntax highlighting for rails
Plug 'tpope/vim-endwise' " add `end` to ruby and other code
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
colorscheme dracula

" Liteline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set noshowmode " Don't show insert, since liteline already does

nnoremap <leader>/ :Ag<Space>
nnoremap <leader>* :Ag <c-r><c-w><cr>
vnoremap * y/<c-r>"<cr>
vnoremap <leader>* y:Ag <c-r>"<cr>

" Save
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

" Run autoformatter
nnoremap <leader>= :ALEFix<cr>

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_elixir = ['mixformat']
let g:neoformat_enabled_ruby = ['rubocop']
let g:neoformat_enabled_reason = ['refmt']

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

" fzf
nnoremap <LEADER>pf :GFiles<CR>
nnoremap <LEADER>ff :History<CR>
nnoremap <LEADER>bb :Buffers<CR>
nnoremap <LEADER>bc :BCommits<CR>
nnoremap <C-P> :Commands<CR>

" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|priv/static\|build\|deps\|dist'

" Goto File mapping
nmap <leader>mgg gf
nmap <leader>mgG <c-w>f

" Buffer switching
nnoremap <leader><tab> <c-^>
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
nnoremap <LEADER>gs :GFiles?<CR>
nnoremap <LEADER>gc :Commits?<CR>
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

" Use <leader><TextObject> for CamelCaseMotion words
call camelcasemotion#CreateMotionMappings('<leader>')

" Language Server
let g:LanguageClient_loggingLevel = "Info"
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'elixir': ['ex-ls'],
    \ }
let g:LanguageClient_rootMarkers = {
    \ 'elixir': ['mix.exs'],
    \ }


let g:LanguageClient_autoStart = 1
nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

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
