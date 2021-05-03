---
title: "Introduction"
description: "How TrueBlocks enhances the Ethereum node, in eight sentences"
lead: "How TrueBlocks enhances the Ethereum node, in eight sentences:"
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

1. The Ethereum node is broken.

2. It is broken because it does not have an index.

3. Continually-growing indexes and content-addressable immutable data stores such as IPFS do not work and play well with each other.

4. In response to this conflict, TrueBlocks chunks the index (that is, we stop adding new records) which allows us to store each chunk on IPFS.

5. We also place a bloom filter in front of each chunk which greatly speeds up the search of the index.

6. Because end-user machines have very small hard drives, TrueBlocks only writes things to the hard drive when the user asks for specific data.

7. Those who say it is impossible to index the Ethereum blockchain on small, desktop machines are wrong.

8. Indexing the Ethereum blockchain turns a broken node into a very performant data server in a fully local environment.

[ *Okay. Sorry. Nine sentences...* ]

9. With a performant direct-from-the-node Ethereum server, we are building amazing, fully-decentralized, 18-decimal-place accurate and *FAST* dApps (as we all thought they were meant to be).
