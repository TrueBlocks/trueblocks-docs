
If you want to generate state pages, just run `hugo` from the root directory. This will gen a file called `public`

To create a new post, run `hugo new <content-directory>/<subdirectory>/<name>.md`

## Important directories:

* The Homepage is in the `layouts/index.html`
* Content templates go in `archetypes`
* `layouts` contains all information about templates
* `config/_default/menus.toml` contains the structure for the overall menu and the section menus

## How to add menu items

Open up `menus.toml`.

If you want to add a head section, add a config to [[main]]. 

``` TOML 
[[main]]   
  name = "Docs"
  url = "/docs/prologue/introduction/"
  weight = 10

```
The more "weight", the farther to the left it will be.

Then change some files in `layouts`. Check out the files the template owner changed here.
https://github.com/atwriter/new_doks_site/pull/1

If you want to add a subsection, add [[<section-name>>]]

```
[[docs]]
  name = "Tools"
  weight = 20
  identifier = "tools"
  url = "/docs/concepts/"
```

The more weight it has, the farther down the section will be.

When you create content, you probably want to create corresponding directories in `content`.






```
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
```
