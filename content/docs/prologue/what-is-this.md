---
title: "What Is This"
description: ""
date: 2021-06-17T19:22:16-03:00
lastmod: 2021-06-17T19:22:16-03:00
draft: false
weight: 0100
images: []
menu:
  docs:
    parent:
      prologue
---

TrueBlocks builds an index that lets you explore the Ethereum blockchain from
your local machine.

## Without a local index, Ethereum is not ownerless

Ethereum is supposed to be ownerless. The blockchain is supposed to be transperant
record of all transactions. Without an index, however, the blockchain is undiscoverable,
like the internet would be without search engines. Or like being lost at sea.

<img src="/docs/img/steam-boat-off-a-harbor.jpg" alt="The term cybernetics stems from the Greek κυβερνήτης (kybernētēs, steersman, governor, pilot, or rudder)When Norman Weiner coined the word, he was fascinated in the control of systems. Who controls Ethereum?" width="500"/>

You can register with some cloud service and access the blockchain remotely.
But just like searching the internet with google, this limits how you explore
the blockchain to _the conditions permitted by the cloud service_.
You can only make queries that service permits. You consent to any query logging
or datamining that the service wants to do, and you can't even be sure the data
is accurate. 

## TrueBlocks provides this local index

Trueblocks builds a local-index directly on your machine.
It ships with large suite of command line options to let you make the queries you
want to make─addresses, names, ABIs, etc.

On top of the command line, we've also built a graphical interface, our [Explorer](/explorer)
application. So you don't need any special technical skills to use TrueBlocks.

### And yes, it's ownerless

TrueBlocks is open source. If you don't like something, you're free to modify the
software, or fork it. 

We also distribute copies of the index on the IPFS, meaning that:
* the data is immutable (i.e. we can't mess with it)
* the data doesn't belong to anyone

## The index provides huge engineering advantages

Besides the philosophical benefits, TrueBlocks is straight up more performant.
Some highlights:

- Querying straight from your hard drive is _faster by many factors._
- Binary cache makes subsequent queries _near instantaneous_
- _Blockchain storage shrinks from terrabytes to gigabytes_. 
- Bloom filters mean _you store only the data you call_.
- Articulate to resolve transactions on the byte level, so it's _more accurate_.
- TrueBlocks works on the byte level, so you can format data how you want. JSON, CSV, gRPC? Who cares? _format agnostic_

TrueBlocks performs so well because the design is 100% data first. We are lifelong
hackers, and we agree with Linus:

> Good programmers 
> worry about data structures and their relationships. _[source](https://lwn.net/Articles/193245/)_

## Great! But I want many more words.

We've got more words for you. [This blog post covers these topics in much more detail](/blog/a-long-winded-explanation-of-trueblocks/).


