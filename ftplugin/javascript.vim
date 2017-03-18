" Make jest work like jasmine.
let g:test#javascript#jasmine#file_pattern = '\v^spec/.*-test\.(js|jsx)$'
let g:test#javascript#jasmine#executable = 'npm test --'

let g:neomake_javascript_enabled_makers = ['eslint']
