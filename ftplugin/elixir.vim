let g:neomake_elixir_enabled_makers = ['credo']

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
