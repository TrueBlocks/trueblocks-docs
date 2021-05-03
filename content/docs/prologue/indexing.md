---
title: "Indexing Addresses"
description: "Using TrueBlocks to Create the Missing Index"
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 0400
toc: true
---

We assume that you've already completed the [Installation](/docs/prologue/installing/) task. Please do so now before proceeding.

## Introduction

TrueBlocks builds an index of "every appearance of every address anywhere on the chain". With this index, we can build fully-local, 100% decentralized dApps such as the [TrueBlocks Explorer](https://github.com/TrueBlocks/trueblocks-explorer).

In this article, we explain how you can get a copy of the TrueBlock index of appearances. We won't explain some of the engineering decisions we've made as that is not the point of this article. Please see our [Blog](/docs/blog/) for that type of information.

## Building the Index

If you have access to an Ethereum tracing node such as TurboGeth, you can build the TrueBlocks index yourself. For information on that, please see our [Blog](/docs/blog/).

For this page, we will take advantage of the fact that TrueBlocks, LLC (the company) produces the index and publishes it to IPFS. We do this for our own reasons -- our software doesn't work without it. We purposefully publish the index data to IPFS so that once our users have it, we can not take it back. This makes it impossible for us to hold our users hostage.

Each time we publish an index chunk (and it's associated bloom filter) to IPFS, we add a record to a *manifest*. The manifest lists all of the index chunks and bloom filters.

For the same reason as above (so we can't take it back), we publish the manifest to IPFS. This gives us an IPFS hash to the manifest which gives us a list of all the IPFS hashes of the entire address index. In other words, we've published immutable, irrevocable access to the entire index for anyone who has the hash of the manifest to use -- not only now but into the far foggy future. The manifest will be there forever. It's immutable data and it's permissionlessly, globally available.

We go one step further -- we publish the hash of the manifest to a smart contract called [The Unchained Index](http://unchainedindex.io).

## Getting the Latest Manifest

You can use `chifra` to retrieve the location of the manifest file from the Unchained Index. Let's look at `chifra state`.

## Chifra Names, Chifra Abis, Chifra State

`chifra` allows you to do many things. We will use `chifra` to accomplish the task at hand which is to get the location of the manifest of the TrueBlocks address index.

The first command we need is `chifra names`.

## Chifra Names

One of the things `chifra` needs is the ability to attach Human understandable names to Ethereum addresses. Type

```shell
chifra
```

You can see that one of the commands is `names`. Type

```shell
chifra names --help
```

This produces this help text

```shell
Usage:    chifra names [-e|-m|-l|-c|-p|-n|-a|-s|-g|-v|-h] <term> [term...]
Purpose:  Query addresses and/or names of well known accounts.

Where:
  terms                 a space separated list of search terms (required)
  -e  (--expand)        expand search to include all fields
  -m  (--match_case)    do case-sensitive search
  -c  (--custom)        include your custom named accounts
  -p  (--prefund)       include prefund accounts
  -n  (--named)         include well know token and airdrop addresses in the search
  -a  (--addr)          display only addresses in the results
  -s  (--entities)      display entity data
  -g  (--tags)          export the list of tags and subtags only
```

You can type `chifra names` to see all the addresses we've accumulated over the years. (Yes -- we can use ENS to enhance this search and we plan to in the near future.)

Type

```shell
chifra names Unchained Index
```

This should return the following address

```shell
0xcfd7f3b24f3551741f922fd8c4381aa4e00fc8fd
```

Copy and paste this response. We will need it. The next thing we need is the ABI for that address. Do this

```shell
chifra abis 0xcfd7f3b24f3551741f922fd8c4381aa4e00fc8fd
```

This will return the full ABI of the Unchained Index smart contract. You should be able to see a function called `manifestHash` with a four-byte signature of `0x337f3f32`.

Now we're going to do something fun. Type this

```shell
chifra state --call 0xcfd7f3b24f3551741f922fd8c4381aa4e00fc8fd!0x337f3f32
```

You should get some interesting JSON data with one field called `manifestHash` equal to an IPFS hash.

What happened here? TrueBlocks queried the smart contract called Unchained Index to retreive the value stored in the `manifestHash` variable. We can now use that to get the manifest of the entire TrueBlocks address index.

Use this command to retrieve the manifest from IPFS:

```shell
curl -s "http://gateway.ipfs.io/ipfs/<manifestHash> -o manifest.txt
```

If you look inside that file, you will see row upon row of three fields

```shell
block-range, bloom hash, index chunk hash
012356406-012358738, QmSJeyXsvNpyXprdfwL5JyiS39VLU7m1kQNun4uM5XQbqu, QmXAZCtJ89KWWMLUkEMoTSkGSiai6aAut9kfYuWBxEoxhS
```

You can retrieve the bloom thus

```shell
curl -s "http://gateway.ipfs.io/ipfs/QmSJeyXsvNpyXprdfwL5JyiS39VLU7m1kQNun4uM5XQbqu" -o 012356406-012358738.bloom
```

## Getting all the Blooms

Additionally, we publish the IPFS hash of a manifest file -- which details all the hashes of all the chunks of the index along with all the bloom filters -- to a smart contract we call the *Unchained Index*.



## Getting a Minimal Version of the Index

The quickest way (and the least resource intensive way) to get the index is to download it directly from IPFS.

Here we will explain a few ways you can either download a minimal version of the TrueBlocks inde`chifra` is an over-arching for TrueBlocks much like `git` is for Git. All interactions with the TrueBlocks tools use the `chifra` command.

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
chifra status
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
