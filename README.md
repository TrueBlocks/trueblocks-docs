
If you want to generate static pages, just run `hugo` from the root directory. This will gen a file called `public`

To create a new post, run `hugo new <content-directory>/<subdirectory>/<name>.md`

## Important directories:

* The Homepage is in the `layouts/index.html`
* Content templates go in `archetypes`
* `layouts` contains all information about templates
* `config/_default/menus.toml` contains the structure for the overall menu and the section menus

## How to add menu items

Open up `config/_default/menus.toml`.

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

