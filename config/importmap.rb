# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "htm", to: "https://ga.jspm.io/npm:htm@3.1.1/dist/htm.module.js", preload: true
pin "react", to: "https://ga.jspm.io/npm:react@17.0.2/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@18.2.0/index.js", preload: true
pin "object-assign", to: "https://ga.jspm.io/npm:object-assign@4.1.1/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.23.0/index.js", preload: true
pin_all_from "app/javascript/components", under: "components"

pin "application", preload: true
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/process-production.js"
pin "axios", to: "https://ga.jspm.io/npm:axios@0.27.2/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/adapters/xhr.js"
pin "#lib/defaults/env/FormData.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/helpers/null.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/buffer.js"
pin "react-router-dom", to: "https://ga.jspm.io/npm:react-router-dom@5.3.1/esm/react-router-dom.js"
pin "@babel/runtime/helpers/esm/extends", to: "https://ga.jspm.io/npm:@babel/runtime@7.18.6/helpers/esm/extends.js"
pin "@babel/runtime/helpers/esm/inheritsLoose", to: "https://ga.jspm.io/npm:@babel/runtime@7.18.6/helpers/esm/inheritsLoose.js"
pin "@babel/runtime/helpers/esm/objectWithoutPropertiesLoose", to: "https://ga.jspm.io/npm:@babel/runtime@7.18.6/helpers/esm/objectWithoutPropertiesLoose.js"
pin "@babel/runtime/helpers/inheritsLoose", to: "https://ga.jspm.io/npm:@babel/runtime@7.18.6/helpers/inheritsLoose.js"
pin "history", to: "https://ga.jspm.io/npm:history@4.10.1/index.js"
pin "hoist-non-react-statics", to: "https://ga.jspm.io/npm:hoist-non-react-statics@3.3.2/dist/hoist-non-react-statics.cjs.js"
pin "isarray", to: "https://ga.jspm.io/npm:isarray@0.0.1/index.js"
pin "mini-create-react-context", to: "https://ga.jspm.io/npm:mini-create-react-context@0.4.1/dist/cjs/index.js"
pin "path-to-regexp", to: "https://ga.jspm.io/npm:path-to-regexp@1.8.0/index.js"
pin "prop-types", to: "https://ga.jspm.io/npm:prop-types@15.8.1/index.js"
pin "react-is", to: "https://ga.jspm.io/npm:react-is@16.13.1/index.js"
pin "react-router", to: "https://ga.jspm.io/npm:react-router@5.3.1/esm/react-router.js"
pin "resolve-pathname", to: "https://ga.jspm.io/npm:resolve-pathname@3.0.0/index.js"
pin "tiny-invariant", to: "https://ga.jspm.io/npm:tiny-invariant@1.2.0/dist/tiny-invariant.esm.js"
pin "tiny-warning", to: "https://ga.jspm.io/npm:tiny-warning@1.0.3/dist/tiny-warning.esm.js"
pin "value-equal", to: "https://ga.jspm.io/npm:value-equal@1.0.1/index.js"
pin "react-error-overlay", to: "https://ga.jspm.io/npm:react-error-overlay@6.0.11/lib/index.js"
