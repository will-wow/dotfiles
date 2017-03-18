" haskell completion
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let $PATH=system('stack path --bin-path')
