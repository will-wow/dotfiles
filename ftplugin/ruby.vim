let g:neomake_ruby_enabled_markers = ['rubocop', 'mri'] " ruby checkers

let g:ri_no_mappings=1
nnoremap <leader>mhh :call ri#LookupNameUnderCursor()<cr> " keyword lookup
nnoremap <leader>mhs :call ri#OpenSearchPrompt(0)<cr> " horizontal split
