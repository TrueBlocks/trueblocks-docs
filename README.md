# TrueBlocks Docs

Repo for the [TrueBlocks.io website](https://trueblocks.io).

Note: There is only a `main` branch which is protected. Make any PRs against this branch and we will review and merge if approriate.

[![hugo rsync](https://github.com/TrueBlocks/trueblocks-docs/actions/workflows/build-and-deploy.yaml/badge.svg)](https://github.com/TrueBlocks/trueblocks-docs/actions/workflows/build-and-deploy.yaml)

## Contributing to the docs

To develop on this site, you need `yarn` and `hugo`.

To run locally first clone the repo then:

1. Install dependencies

```[shell]
yarn install
```

1. serve hugo to local host

```[shell]
hugo serve
```

Open the website in your browser at http://localhost:1313.

The theme was done by [the good people at Doks](https://github.com/h-enk/doks/).

## Important directories

- The homepage is in the `layouts/index.html`.
- Content templates are stored in `archetypes`.
- `layouts` contains all information about templates.
- `config/_default/menus.toml` contains the structure for the overall menu and the section menus.

## How to add menu items

Open up `config/_default/menus.toml`.

### Adding a main section

If you want to add a head section, add a config to `[[main]]`.

```TOML
[[main]]
name = "Docs"
url = "/docs/prologue/introduction/"
weight = 10
```

The more "weight", the farther to the left it will be.

Then change some files in `layouts`. Check out the files the template owner changed [here](https://github.com/atwriter/new_doks_site/pull/1).

### Adding a sub section

If you want to add a subsection, it will look like this under `[[<section-name>]]`

```TOML
[[docs]]
name = "Tools"
weight = 20
identifier = "tools"
url = "/docs/concepts/"
```

The more weight it has, the farther down the section will be.

When you create content, you probably want to create corresponding directories in `content`.

## Adding new pages

In the `content` folder, create a new page. In the new directory, add a file called `_index.md`. The name must start with `_`, unless you only need one page. If you need subpages, you add them to the same directory.

The new page will use the default layout. It may happen that it goes into "list" mode (the text content is not displayed and part of it is rendered as headers). In such a case, add `layout: single` in front matter.

If you need a different layout for the pages, create a new directory in `layouts` using the same name as in `content` folder.

## Contributing

We love contributors. Please see information about our [work flow](https://github.com/TrueBlocks/trueblocks-core/blob/develop/docs/BRANCHING.md) before proceeding.

1. Fork this repository into your own repo.
2. From the `main` branch, create a new branch: `git checkout -b <branch_name>`.
3. Make changes to your local branch and commit them to your forked repo: `git commit -m '<commit_message>'`
4. Push back to the original branch: `git push origin TrueBlocks/trueblocks-docs`
5. Create the pull request.

## Contact

If you have questions, comments, or complaints, please join the discussion on our discord server which is [linked from our website](https://trueblocks.io).

## List of Contributors

Thanks to the following people who have contributed to this project:

- [tjayrush](https://github.com/tjayrush)
- [MattDodsonEnglish](https://github.com/MattDodsonEnglish)
