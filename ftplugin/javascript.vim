" Make jest work like jasmine.
let g:test#javascript#jasmine#file_pattern = '\v^spec/.*-test\.(js|jsx)$'
let g:test#javascript#jasmine#executable = 'yarn test --'

let g:neomake_javascript_enabled_makers = ['eslint']

let g:rails_projections = {
  \     "client/assets/javascripts/*.jsx": {
  \       "type": "src",
  \       "alternate": "spec/javascripts/{}-test.js"
  \     },
  \     "client/assets/javascripts/*.js": {
  \       "type": "src",
  \       "alternate": "spec/javascripts/{}-test.js"
  \     },
  \     "spec/javascripts/components/*-test.js": {
  \       "type": "test",
  \       "alternate": "client/assets/javascripts/components/{}.jsx"
  \     },
  \     "spec/javascripts/*-test.js": {
  \       "type": "test",
  \       "alternate": "client/assets/javascripts/{}.js"
  \     }
  \ }

let g:projectionist_heuristics = {
  \   "package.json&spec/javascripts/*": {
  \     "client/assets/javascripts/*.jsx": {
  \       "type": "src",
  \       "alternate": "spec/javascripts/{}-test.js"
  \     },
  \     "client/assets/javascripts/*.js": {
  \       "type": "src",
  \       "alternate": "spec/javascripts/{}-test.js"
  \     },
  \     "spec/javascripts/components/*-test.js": {
  \       "type": "test",
  \       "alternate": "client/assets/javascripts/components/{}.jsx"
  \     },
  \     "spec/javascripts/*-test.js": {
  \       "type": "test",
  \       "alternate": "client/assets/javascripts/{}.js"
  \     }
  \   }
  \ }
