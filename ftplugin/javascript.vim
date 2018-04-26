let g:rails_projections = {
  \     "client/assets/javascripts/components/*.jsx": {
  \       "type": "component",
  \       "alternate": "spec/javascripts/components/{}-test.js",
  \       "template": [
  \         "import React from 'react';",
  \         "import PropTypes from 'prop-types';",
  \         "",
  \         "export default function Component({}) {",
  \         "  return (",
  \         "    <div className=\"\">",
  \         "    </div>",
  \         "  );",
  \         "}",
  \         "",
  \         "component.propTypes = {",
  \         "  foo: PropTypes.string,",
  \         "};"
  \       ]
  \     },
  \     "client/assets/javascripts/*.js": {
  \       "type": "src",
  \       "alternate": "spec/javascripts/{}-test.js"
  \     },
  \     "spec/javascripts/components/*-test.js": {
  \       "type": "component-test",
  \       "alternate": "client/assets/javascripts/components/{}.jsx",
  \       "template": [
  \         "import React from 'react';",
  \         "import { shallow } from 'enzyme';",
  \         "",
  \         "import Component, { SubComponent } from 'components/Component';",
  \         "",
  \         "describe('Component', function() {",
  \         "  function subject(percentRemaining, validationState) {",
  \         "    return shallow(<Component />);",
  \         "  }",
  \         "",
  \         "  it('is true', function() {",
  \         "    expect(true).toBe(true);",
  \         "  });",
  \         "});"
  \       ]
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
