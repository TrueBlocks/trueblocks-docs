To develop on this site, you need `npm` and `hugo`.

To run locally:

1. Install npm dependencies
 
```shell
npm install
```

2. serve hugo to local host

```shell
hugo server
```

We have a few customizations, but all the hard work for creating this theme was done by the good people at Doks:
https://github.com/h-enk/doks/

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

If you want to add a subsection, it will look like this under `[[<section-name>]]`

```
[[docs]]
  name = "Tools"
  weight = 20
  identifier = "tools"
  url = "/docs/concepts/"
```

The more weight it has, the farther down the section will be.

When you create content, you probably want to create corresponding directories in `content`.

