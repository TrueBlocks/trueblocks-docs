GitHub repo for [TrueBlocks.io](https://trueblocks.io).

[![hugo rsync](https://github.com/TrueBlocks/trueblocks-docs/actions/workflows/deploy.yaml/badge.svg)](https://github.com/TrueBlocks/trueblocks-docs/actions/workflows/deploy.yaml)
[![link checker](https://github.com/TrueBlocks/trueblocks-docs/actions/workflows/link-checker.yaml/badge.svg)](https://github.com/TrueBlocks/trueblocks-docs/actions/workflows/link-checker.yaml)

### Contributing

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

## Contributing

We love contributors. Please see information about our [work flow](https://github.com/TrueBlocks/trueblocks-core/blob/master/docs/BRANCHING.md) before proceeding.

1. Fork this repository into your own repo.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make changes to your local branch and commit them to your forked repo: `git commit -m '<commit_message>'`
4. Push back to the original branch: `git push origin TrueBlocks/trueblocks-core`
5. Create the pull request.

## List of Contributors

Thanks to the following people who have contributed to this project:

* [@tjayrush](https://github.com/tjayrush)
* [@MattDodsonEnglish](https://github.com/MattDodsonEnglish)

## Contact

If you have questions, comments, or complaints, please join the discussion on our discord server which is [linked from our website](https://trueblocks.io).
