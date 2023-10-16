let b:ale_linters = ['rubocop']
let b:ale_fixers = ['rubocop']

let g:ri_no_mappings=1
nnoremap <leader>mhh :call ri#LookupNameUnderCursor()<cr> " keyword lookup
nnoremap <leader>mhs :call ri#OpenSearchPrompt(0)<cr> " horizontal split
