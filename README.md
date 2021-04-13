# How this site works

Notes as I learn:

* The Homepage is in the `layouts/index.html`
* If you want to generate state pages, just run `hugo` from the root directory. This will gen a file called `public`

.
├── archetypes
│   ├── blog.md
│   ├── default.md
│   └── docs.md
├── assets
│   └── lambda
│       └── hi-from-lambda.js
├── babel.config.js
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── config
│   ├── _default
│   │   ├── config.toml
│   │   ├── menus.toml
│   │   └── params.toml
│   ├── next
│   │   └── config.toml
│   ├── postcss.config.js
│   └── production
│       └── config.toml
├── content
│   ├── blog
│   │   ├── _index.md
│   │   ├── long-winded
│   │   │   └── long-winded-explanation.md
│   │   └── test1.md
│   ├── contact
│   │   └── index.md
│   ├── contributors
│   │   ├── henk-verlinde
│   │   │   └── _index.md
│   │   └── _index.md
│   ├── docs
│   │   ├── concepts
│   │   │   └── extracting.md
│   │   ├── _index.md
│   │   ├── prologue
│   │   │   ├── _index.md
│   │   │   ├── introduction.md
│   │   │   └── quick-start.md
│   │   └── tools
│   │       └── chifra.md
│   ├── explorer
│   │   └── explorer.md
│   ├── _index.md
│   └── privacy-policy
│       └── index.md
├── data
│   └── doks.json
├── layouts
│   ├── 404.html
│   ├── blog
│   │   ├── list.html
│   │   └── single.html
│   ├── contributors
│   │   └── list.html
│   ├── _default
│   │   ├── baseof.html
│   │   ├── index.js
│   │   ├── index.json
│   │   ├── list.html
│   │   ├── _markup
│   │   ├── section.sitemap.xml
│   │   └── single.html
│   ├── docs
│   │   ├── list.html
│   │   └── single.html
│   ├── index.headers
│   ├── index.html
│   ├── index.redirects
│   ├── partials
│   │   ├── footer
│   │   │   ├── alert.html
│   │   │   ├── footer.html
│   │   │   └── script-footer.html
│   │   ├── head
│   │   │   ├── favicons.html
│   │   │   ├── head.html
│   │   │   ├── opengraph.html
│   │   │   ├── resource-hints.html
│   │   │   ├── script-header.html
│   │   │   ├── seo.html
│   │   │   ├── structured-data.html
│   │   │   ├── stylesheet.html
│   │   │   └── twitter_cards.html
│   │   ├── header
│   │   │   └── header.html
│   │   ├── main
│   │   │   ├── blog-meta.html
│   │   │   ├── breadcrumb.html
│   │   │   ├── docs-navigation.html
│   │   │   ├── edit-page.html
│   │   │   └── headline-hash.html
│   │   └── sidebar
│   │       ├── docs-menu.html
│   │       └── docs-toc.html
│   ├── robots.txt
│   ├── rss.xml
│   ├── shortcodes
│   │   ├── alert.html
│   │   ├── btn-copy.html
│   │   ├── email.html
│   │   ├── img.html
│   │   └── img-simple.html
│   └── sitemap.xml
├── LICENSE
├── netlify.toml
├── package.json
├── package-lock.json
├── README.md
├── resources
│   └── _gen
│       ├── assets
│       │   └── scss
│       │       └── scss
│       │           ├── app.scss_1920d2ec1ff1120c91690141d2072447.content
│       │           └── app.scss_1920d2ec1ff1120c91690141d2072447.json
│       └── images
├── theme.toml
└── yarn.lock

39 directories, 81 files
