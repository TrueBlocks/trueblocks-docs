---
title : "What is this?"
description: "TrueBlocks Docs"
lead: "TrueBlocks builds and publishes an index that lets you explore the Ethereum blockchain from your local machine."
date: 2020-10-06T08:48:23+00:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
alias: ["/docs/prologue/what-is-this/"]
weight: 001
menu:
  docs:
    parent:
      prologue
---

TrueBlocks builds and publishes an index that lets you explore the Ethereum
blockchain from your local machine.

## Without a local index, Ethereum is not really permissionless

More specifically, without an index, Ethereum cannot effectively serve
desktop applications the type of data that the applications need.

Ethereum is supposed to be permissionless. The blockchain is supposed to be a
record of all transactions. Without an index, however, the blockchain is undiscoverable,
like the internet would be without search engines. Or like being lost at sea...

<img src="/docs/img/steam-boat-off-a-harbor.jpg" alt="The term cybernetics stems from the Greek κυβερνήτης (kybernētēs, steersman, governor, pilot, or rudder)When Norman Weiner coined the word, he was fascinated in the control of systems. Who controls Ethereum?" width="500"/>

Of course, you can register with an Ethereum block explorer, like EtherScan,
and access the blockchain remotely.
The trouble is that these resources are shared by many users,
which entails an anti-privacy sequence:

1. To prevent any user from using more than their fair share, the service
needs to limit each user's usage
2. Because of (1), the service needs to identify each user
3. Because of (2), the service is no longer private, especially as each user
likely queries the same set of addresses each time they visit.

Furthermore, just like searching the internet with Google,
you consent to any query logging or datamining that the service wants to do,
and you can't even be sure the data is accurate.

## TrueBlocks provides this local index

Trueblocks builds a local index directly on your machine.
It ships with large suite of command line options to let you make the queries you
want to make─addresses, names, ABIs, etc.

In addition to the command line, TrueBlocks also provides a graphical user interface
with the [Explorer application](/docs/install/install-explorer).
So you don't need to be highly technical to use TrueBlocks.

### And yes, it's permissionless

TrueBlocks is open source. If you don't like something, you're free to modify the
software, or fork it.

We also distribute copies of the index on the IPFS, meaning that:
* the data is immutable (i.e. we can't mess with it)
* the data doesn't belong to anyone

## The index provides huge engineering advantages

Besides the philosophical benefits, TrueBlocks is straight up more performant.
Some highlights:

- Querying straight from your hard drive is _faster by many factors._
- Binary cache makes subsequent queries _nearly instantaneous_
- Leaving the data on the chain until it's queried shrinks storage requirements for the typical user from _terabytes to gigabytes_.
- Bloom filters further reduce computation and storage overhead
- Articulate to resolve transactions on the byte level, _turning byte streams into human-readable data._
- _Format-agnostic._ Receive data in JSON, CSV, plain text, etc.

TrueBlocks performs so well because the design is 100% data first. We are lifelong
hackers, and we agree with [Linus Torvalds when he
said](https://lwn.net/Articles/193245/):

> In fact, I'm a huge proponent of designing your code around the data, rather than the other way around

## Great! But I want many more words.

We've got more words for you. [This blog post covers these topics in much more detail](/blog/a-long-winded-explanation-of-trueblocks/).
