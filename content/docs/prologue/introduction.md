---
title: "Introduction"
description: "How TrueBlocks fixes some problems of Ethereum, in eight sentences:"
lead: "How TrueBlocks fixes some problems of Ethereum, in eight sentences:"
date: 2020-10-06T08:48:57+00:00
lastmod: 2020-10-06T08:48:57+00:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 100
toc: true
---

1. The Ethereum node is broken,

2. The thing that is broken is that the node does not have an index,

3. It is impossible to simultaneously build an continually-growing index and deliver that index over a content-addressable immutable store such as IPFS,

4. In response to this impossibility, one must chunk the index (that is, create a time-ordered log of indexes of a time-ordered log),

5. Placing a bloom filter in front of a chunked index wildly speeds up the search of the index,

6. In order to properly work on an end user’s machine, the system must write things to the hard drive only when the user instructs the system to do so,

7. It’s possible to index the Ethereum blockchain

8. Indexing the Ethereum blockchain is a small data problem, not a big data problem

