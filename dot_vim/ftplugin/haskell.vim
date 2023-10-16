" haskell completion
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:haskellmode_completion_ghc = 1
let g:hindent_line_length = 80

nnoremap <leader>mhh :HoogleInfo <c-r><c-w><cr>
vnoremap <leader>mhh y :HoogleInfo <c-r>"<cr>

" Fix path issues from vim.wikia.com/wiki/Set_working_directory_to_the_current_file
let s:default_path = escape(&path, '\ ') " store default value of 'path'
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path
