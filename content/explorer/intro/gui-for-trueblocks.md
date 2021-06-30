---
description: ""
lead: ""
date: 2021-04-15T19:56:20-03:00
lastmod: 2021-04-15T19:56:20-03:00
draft: false
images: []
menu: 
  explorer:
    parent: "explorer-intro"
toc: true
---

Trueblocks Explorer is browser application that lets you explore the Ethereum blockchain.

## A quick install

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

