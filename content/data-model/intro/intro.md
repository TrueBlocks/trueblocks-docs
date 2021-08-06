---
title: "Enhanced Ethereum Data"
description: "Underlying all Ethereum data─and therefore all TrueBlocks data─is a set of inter-related data models."
lead: "Underlying all Ethereum data─and therefore all TrueBlocks data─is a set of inter-related data models."
date: 2021-07-01T11:40:11-03:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu: 
  data:
    parent: intro
weight: 1000
toc: true
---

<img src="/data-model/data-model-600.png" alt="TrueBlocks is full of data that interrelates." width="600"/>

## Blockchain + people = TrueBlocks-enhanced data

Broadly, the data TrueBlocks provides divides into two categories:

* [Blockchain data](../blockchain-data/)
* [Account-organized data](../accounts)

On its own Ethereum blockchain data is just a boring blob of bytes.
What really interests us are the stories behind this data--questions like:
* What addresses were involved?
* Can I see all transactions involved this address?
* When did the transaction happen?
* What smart contracts were involved?

Through TrueBlock's `--articulate` option, you can unpack the input fields
of transactions and trace through the whole history of contract calls.

The account-organized data describes things like account collections, account
balances, and transaction histories. This data tells you the _who_, _where_, and
_why_ behind the Blockchain transactions. It is where TrueBlocks really shines.

## This data applies to all TrueBlocks apps

Because all TrueBlocks apps use the same backend, these references describe
the data found with the command line, the Explorer app, and the API. However,
the presentation of the data may change depending on the app and file format.

