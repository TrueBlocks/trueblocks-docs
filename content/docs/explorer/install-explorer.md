---
title: "Install Explorer"
description: ""
lead: ""
date: 2021-07-02T08:01:07-03:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu: 
  docs:
    parent: explorer
weight: 3100
toc: true
---

First, make sure that you have the `chifra-core` backend up and running,
then run the application from [a clone of the explorer repo](https://github.com/TrueBlocks/trueblocks-explorer).

### PreReqs.

1. Set up the trueblocks backend using the [chifra installation instructions](/docs/prologue/installing-trueblocks)
2. In a terminal window, run the command `chifra serve`

### Install from the repo

In a new terminal (keep the `chifra serve` process running)

1. git clone git@github.com:TrueBlocks/trueblocks-explorer.git
2. cd trueblocks-explorer
3. cp .env.example .env
4. yarn
5. yarn develop

Open your browser, and access the app from `localhost:1234`.

