---
title: "Introducing Chifra"
description: "First introduction to chifra"
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "chifra"
weight: 1000
toc: true
---

Similar to `git`, TrueBlocks has an overarching command called `chifra` that gives you access to all of the other subcommands.

Type:

```shell
chifra
```

You will see a long list of commands similar to this

```txt
  Usage:    chifra command
  Purpose:  Access to all TrueBlocks tools (chifra <cmd> --help for more).

  Where:
         ACCOUNTS
           list          list every appearance of an address anywhere on the chain
           export        export full detail of transactions for one or more addresses
           monitors      add, remove, clean, and list address monitors
           names         query addresses or names of well known accounts
           abis          fetches the ABI for a smart contract
         CHAIN DATA
           blocks        retrieve one or more blocks from the chain or local cache
           transactions  retrieve one or more transactions from the chain or local cache
           receipts      retrieve receipts for the given transaction(s)
           logs          retrieve logs for the given transaction(s)
           traces        retrieve traces for the given transaction(s)
           when          find block(s) based on date, blockNum, timestamp, or 'special'
         CHAIN STATE
           state         retrieve account balance(s) for one or more addresses at given block(s)
           tokens        retrieve token balance(s) for one or more addresses at given block(s)
         ADMIN
           status        report on the status of the TrueBlocks system
           serve         serve the TrueBlocks API using the flame server
           scrape        scan the chain and update the TrueBlocks index of appearances
           init          initialize the index of appearances by downloading Bloom filters
           pins          manage pinned index of appearances and associated Bloom filters
         OTHER
           quotes        freshen and/or display Ethereum price data
           explore       open an explorer for a given address, block, or transaction
           slurp         fetch data from EtherScan for any address
```
---
You may get more help on any command by typing `chifra <cmd> --help`.

### Getting status

Let's look at an easy command to get started called `status`.

```shell
chifra status --terse
```

If you get a valid response, congratulations, your installation is working. You may skip ahead to the 'Using TrueBlocks' section below.

### -- Troubleshooting

Depending on your setup, you may get the following error message when you run some `chifra` commands:

```shell
  Warning: A request to your Ethereum node (http://localhost:8545) resulted
  in the following error [Could not connect to server]. Specify a valid
  rpcProvider by editing $CONFIG/trueblocks.toml.
```

If you get this error, edit the configuration file mentioned. The file is well documented, so refer to that file for further information.

When the `chifra status` command returns a valid response, you may move to the next section. If
you continue to have trouble, join our [discord disscussion](https://discord.gg/kAFcZH2x7K).

## Using chifra

If you've gotten this far, you're ready to use TrueBlocks.

Let's try another simple command to show Ethereum block data. This command shows every 10th block between the first and the 100,000th.

```shell
chifra blocks 0-100000:10
```

Hit `Control+C` to stop the processing.

This shows one of the basic ideas behind TrueBlocks: make the Ethereum data easier to use.

Play around with other options. See what you can do.

## Conclusion

By this point, you should have TrueBlocks properly installed and be able to get simple blockchain data from your node. All of the chifra commands should now work. The next section further introduces you to `chifra`.

Please see the [Using Chifra](/docs/chifra/using-chifra/) page to proceed.
