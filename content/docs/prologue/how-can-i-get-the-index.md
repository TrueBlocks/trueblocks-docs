---
title: "How Can I Get the Index?"
description: "There are three ways to get the index. Each way involves some
tradeoff between initialization time, storage use, and local access."
lead: "After you install the core TrueBlocks utilities, you can access the index in three ways.
Which way is the best for you? That depends on the tradeoffs you are willing to make."
date: 2021-08-09T10:19:51-03:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu: 
  docs:
    parent: prologue
weight: 550	
toc: true
---

|If you want|and can tolerate|you probably want to use|
|-----------|---------------|------------------|
|To use the least amount of storage and get started quickly, without needing a node|slow first query times, and an index that's a bit behind the chain and was built by someone else|[`chifra init`](#use-init-to-get-only-the-chunks-you-query)|
|Fast first queries for a large amount of addresses, without needing a node|a few hours of start-up time, 60-80GB of storage use, and an index that's a bit behind the chain and built by someone else|[`chifra pins --init_all`](#use_init_all-to-get-all-index-chunks)|
|A fully local index, at the very front of the chain, which you can query instantly|A few days of start-up time, (probably) running your own node|[`chifra scrape`](#use-scrape-to-build-your-own-index)|

## How to grab the index with the IPFS

If you aren't running a node, or can't spend a few days building your own index,
you probably want to download the index from the IPFS manifest.

To do this, you have two options:

* run `chifra init` to download only the Blooms, then download the chunks on a per query basis
* run `chifra pins` to download all index chunks upfront 

### Use init to get only the chunks you query

To get all index chunks, run `chifra init`.

Update by periodically running the command again ([read about the finding the latest manifest](#Supplementary-how-can-I-see-when-the-manifest-was-last-published)).

For full instructions, see the [`chifra init` command documentation](../../chifra/admin.md#chifra-init).

**Initial set up time**: Between 10 minutes and 5 hours, depending on your machine and network.
On 2021-08-10, we ran a test on low grade 2015 consumer hardware with a slow network.
This process took 4 hours, probably close to the upperbound for most users.

**Storage use**: The initial set of index Blooms occupy about 1GB.
Each index chunk that you download occupies about 25MB.
How many chunks you need to store varies with amount of activity on the account.
* For typical addresses (e.g. personal accounts), storage is somewhere between 50--500MB
* For very active addresses, storage is up to 1 or 2GB.
* For popular smart contracts, this may be up to 50GB.

**How it works**

When you run `chifra init`, TrueBlocks downloads a set of Bloom filters from the latest published manifest to your local machine.

After that, when you want to explore an address history, e.g. with the command
`chifra export <address>`, TrueBlocks:

1. Scans the Bloom filters for potential matches and downloads the index chunks.
2. Returns the set of real matches in the format `<block number>, <tx_id>`
3. Then, with this data it pulls the details from the node or remote RPC.
4. After the data is cached, future queries for this address are nearly instant.

### Use init_all to get all index chunks

To get all index chunks, run `chifra pins init_all`.

Update by periodically running the command again([read about the finding the latest manifest](#Supplementary-how-can-I-see-when-the-manifest-was-last-published)).

For detailed instructions, see the [`chifra pins` command documentation](../../chifra/admin#chifra-pins).

**Initial set up time**: Somewhere between six and twelve hours.

**Storage use**: About 60GB-80GB

**How it works**

The initialization is very similar to the `init` process described in the previous section.

However, while `chifra init` downloads index chunks only after a user queries an address and TrueBlocks searches the Blooms,
`chifra pins --init_all` _downloads all index chunks up front_.

While the initialization is hours longer, the first queries you make do not have to check all Blooms and download chunks.
So, the first time you run `chifra export <transaction>`, the process is much faster than it is if you initialize with `chifra pins`.

If you use caching, later queries for this address return almost instantly.

## Use scrape to build your own index

To build your own index, run `chifra scrape`.

For detailed instructions, see the [`chifra scrape` command documentation](../../chifra/admin#chifra-scrape).

**Initial Set up time**: Highly dependant on hardware and network performance, but early users have reported 2-4 days (you probably want to run `scrape` in an application like `tmux`).

**Storage Use**: About 2TB.

**How it works**:

The end result of `chifa scrape` is the same as the end result of `chifra pins --init_all`.
However, the process is crucially different: rather than downloading the index we publish,
`scrape` _builds an index on your local machine, connecting directly with the whatever RPC your config points to_.

A good explanation requires a long form article. For now, the curious can look in the best documentation there is, the `src`directory of the source code.

## Supplementary: how can I see when the manifest was last published?

If you are using one of the IPFS options, you probably want to know how to find the latest block on your index.

As of August 2021, the manifest is published weekly.
We want to make it more frequent, with the eventual goal of publishing the manifest per block.
We welcome peers and alternative hosters too!.

You can find the most [recent manifest at unchainedindex.io](https://unchainedindex.io).

Each pin has a given block range, which you can check yourself using `chifra`.

For example, see the last manifest record by running

```shell
chifra pins --list | tail -n 1
```

This outputs something like this:

```
012909804-012912694     QmSQvJ5GPyc8juthKgvMaonxm2t2m939MphyMhBRuHKJzt  QmVCZdXD9EMU9jR6HKp8V1bC74DQDCzGurLxnK6KnbV2LP
```

The first field of the output provides the block range for the index chunk.
So, you could see when the last range was published by running `chifra when`
on the last record:

```shell
$chifra when 012912694 
blocknumber     timestamp       date    name
12912694        1627451435      2021-07-28 05:50:35 UTC
```
