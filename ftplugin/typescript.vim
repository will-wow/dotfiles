function! neomake#makers#ft#typescript#tslint() abort
  return {
        \ 'args': [
          \ '%:p', '--format verbose',
          \ '--config',
          \ neomake#utils#FindGlobFile(expand('%:p:h'), '.tslint.json')
        \ ],
        \ 'errorformat': '%E%f[%l\, %c]: %m'
        \ }
endfunction

let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
