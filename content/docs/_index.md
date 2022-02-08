---
title : "About TrueBlocks"
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

## Permissionless?

Blockchains are supposed to be permissionless. But, are they?

In one sense, "Yes." Anyone may interact with a blockchain. All you need is a wallet and access to an RPC...wait...that's not permissionless.

It's worse than that. You can't see your own history of transactions without visiting a website. "Please Mr. Blockchain Explorer...please may I see my transactions?"

It's as if you're lost at sea...

<img src="/docs/img/steam-boat-off-a-harbor.jpg" alt="Who's stearing this boat?" width="500"/>

---
Anyone can visit EtherScan for free. And, they give us (give us!) anything we want. But do you think they're not watching? Do you think they're not connecting your Ethereum address to your IP address? Why wouldn't they?

Websites are inherently the wrong solution for decentralized data:

1. To prevent selfish users from using more than their fair share, the website must limit your usage (permissionless?)
2. The only way to accomplish (1) is to identify each user (private?)
3. If (2) happens, it's trivial to attach that identification to an address (we all visit the same addresses repeatedly).
4. Connecting IP address to name is already trivial on the internet.

It may not be true now, but do you want the big data people to know how you spend your money? Everyone knows this is going to happen. At TrueBlocks, we ask "why not fix it now?"

## TrueBlocks provides a possible solution

We think there's a two-part problem:

(1) Blockchains are difficult to run,  
(2) Even if one runs a blockchain, getting data from that chain is hard to do.

Trueblocks solves the second problem making the first problem less onerous.

TrueBlocks builds a local index of addresses on your machine. This allows you to quickly find every appearance of any of your own accounts without exposing your interest in those address to anyone else. 

TrueBlocks ships with large suite of command line tools to let you make exactly the queries you want to make. In addition to the command line, TrueBlocks provides a server tool that delivers this information to your applications. We've also built an interface with our open source [Account Explorer](/docs/install/install-explorer).

### Automatically Sharing the Index

TrueBlocks is open source. If you don't like something, you're free to modify the software, or fork it.

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
