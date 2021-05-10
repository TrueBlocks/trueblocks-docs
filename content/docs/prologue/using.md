---
title: "Using Chifra"
description: "How to Use TrueBlocks to Get Useful Data"
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 0300
toc: true
---

We assume that you've already completed the [Installation](/docs/prologue/installing/) task. Please do so before proceeding.

`chifra` is an over-arching for TrueBlocks much like `git` is for Git. All interactions with the TrueBlocks tools use the `chifra` command.

## Getting Help

Every `chifra` sub-command comes with an associated help page. To get help for `chifra` itself, simply type

```shell
chifra
```

A long list of commands should show. (If you have trouble, see the [Installation](/docs/installing/) page.)

To get help for a specific command, type

```shell
chifra <cmd> --help
```

To get more detailed help, type

```shell
chifra <cmd> --help --verbose 2
```

## Getting System Status

The `chifra` command gives you access to all of TrueBlocks' functionality. Get system status by typing

```shell
chifra status --terse
```

## Getting Blockchain Data

Let's see if we can get some actual blockchain data.

**Getting Blocks**

The following command returns block data from block 2,001,002. The data is returned as JSON.

```shell
chifra blocks 2001002
```

Notice the full transactional details are included for each of the seven transactions in the block. You can show just the transaction hashes with

```shell
chifra blocks 2001002 --hashes_only
```

Copy one of those transaction hashes and paste it into the next command

```shell
chifra transactions 0x5f965c...9f26e12  # use the full hash
```

This command shows a single transaction's data. But, you may have noticed that the data is shown as tab separated rows. In general, block data (which is structured) is presented as JSON while primarily non-structured data is presented as TXT.

**Formatting Output**

Every `chifra` command accepts a few optional parameters including `--verbose` and `--fmt`. `--verbose` is useful when debugging. The `--fmt` option allows you to specify the format of the output. It accepts three values:

```shell
chifra blocks 2002 --fmt json   # the default for blocks
chifra blocks 2002 --fmt txt    # tab delimited text
chifra blocks 2002 --fmt csv    # comma separated values
```

These options are available for all `chifra` commands. (Although in some cases, they are ignored.) One might wish to use the `csv` and `txt` options if one is engaged in data science for example.

## More Data Commands

Below, we present a few of the other `chifra` commands without a lot of description.

**Transactions and Logs and Traces, Oh My!**

```shell
# The first transaction in block 2,002,002
chifra transactions 2001002.0

# All transactions in block 2,002,002 as comma separated values
chifra transactions --fmt csv 2001002.\*

# Every event in block 4,503,002
chifra logs --fmt json 4503002.\*

# Every event in block 4,503,002 -- articulated (see below)
chifra logs --fmt json --articulate 4503002.\*

# Every trace in the second transaction of block 4,503,002
chifra traces --fmt json --articulate 4503002.1

```

Please see the help files for `chifra blocks --help` and `chifra transactions --help` for more information, including all the options for specifying blocks and transactions (which are many and varied).

**Articulated Data**

Most TrueBlocks' commands accept an option called `--articulate`. The easiest way to explain `articulated data` is to say it is "ugly blockchain data turned into human readable text".

For example, the following command shows logs from the third transaction in block 4,503,002

```shell
chifra logs --fmt json 4503002.2
```

Pretty ugly. Compare that to this command

```shell
chifra logs --fmt json --articulate 4503002.2
```

You'll see additional (and much more easy to understand) data. In particular, you'll see an `articulatedLog`. That is "ugly log data presented in human-readable form."

See [Getting ERC20 Transfer Events](/blog/recipe-getting-erc20-transfer-events/) for an example of using articulation.

## Other Commands

There are many other `chifra` commands including `list` and `export` that we still study next. Other commands allow you to `serve` a JSON API presenting each command as an API route, `init` which pulls parts of the index data from IPFS, and `scrape` which builds the index.

## Conclusion

See our [Blog](/blog/) for some example recipes for accomplishing various tasks. Also, see the [help pages](/docs/chifra/) for each individual tool.

In the next section, we discuss the [Indexing Appearances]()
