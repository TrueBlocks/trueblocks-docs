---
title : "Do I need a node?"
description: "A node is not required, but that's the only way use Trueblocks as it is intended."
lead: ""
date: 2020-10-06T08:48:45+00:00
lastmod: 2020-10-06T08:48:45+00:00
draft: false
images: []
menu:
  docs:
    parent:
      prologue
weight: 0150
---

If you want your queries to be totally private and as up-to-date as possible,
then _yes, you need a node_.
We highly recommend Turbo-Geth.
It's not as hard to set up many people think, but it does require two TBs of storage.

Even if you're not running a node, TrueBlocks can still build a local index on
your machine. But you have to make a compromise somewhere else.

## Without a node, you must choose between privacy and live blockhain data

If you can't run a node, TrueBlocks offers two solution. You can either:

* Build the index locally, but make queries to a remote RPC.
* Build the index from our IPFS manifest, but lose access to live data

### Lose ownership: query using a remote RPC

If you need access to live data, you might decide it's worth it to build the
TrueBlocks index from data provided by an RPC.
In this case, you can just add the RPC's url and API key to your config,
as [described in step 3 of our install instructions](/docs/prologue/installing-trueblocks/#3-update-the-configs-for-your-rpc-and-api-keys)

Of course now the queries depend on data provided by the RPC node.
And not all nodes are equal.
If you do go this route, Archive nodes are the best choice for Trueblocks.

### Lose live data: build the index with our IPFS index

You can also build the index using our IPFS manifest. This is, by far, the
route we recommend for users without nodes. Using IPFS provides huge
privacy and performance benefits.

* The index is immutable, so you know whether it's been tampered with
* The index is decentralized, so no one owns it
* The query directly from your machine, so  it's lightning fast
* We use bloom filters, so you need to store only the fraction of the blockchain that you are interested in 

Of course, the problem is that we only publish to the IPFS periodically.
This means our version doesn't contain the latest data.

