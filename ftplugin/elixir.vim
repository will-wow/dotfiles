let b:ale_linters = ['credo']

let g:projectionist_heuristics = {
  \   "mix.exs": {
  \     "web/*.ex": {
  \       "type": "src",
  \       "alternate": "test/{}_test.exs"
  \     },
  \     "test/*_test.exs": {
  \       "type": "test",
  \       "alternate": "web/{}.ex"
  \     }
  \   }
  \ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
