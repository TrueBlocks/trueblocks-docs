---
title: "Introduction"
description: "Some Thoughts on the Broken Ethereum Node"
date: 2020-10-06T08:48:57+00:00
lastmod: 2020-10-06T08:48:57+00:00
draft: true
images: []
menu:
  docs:
    parent: "prologue"
weight: 0100
toc: true
---

1. The Ethereum node software serves two masters. The first master, which is serves well, is synchronizing to the network. The second master, which it serves very poorly, is serving RPC data for off-chain uses.

2. Because the node is so bad at serving off-chain data, people resort to Web 2.0 ETL workflows. That is, (e)xtract the data from the node, (t)ransform it to make palitable to databases, and (l)oad it into an ever-growing array of fast, expensive cloud API servers.

3. All three aspects of the ETL process poses an threat to a truly decentralized ecosystem.

4. Ethereum's composibility means that smart contracts may invoke many other smart contracts during a single transaction. In fact, some Ethereum transaction create megabytes of extracted data. This leads to a massive explosion of data. This threatens the ecosystem becuase only organizations with massive IT budgets can afford to extract and maintain all that data.

5. The transformation process is equally theatening. The Ethereum network comes to consensus on the network's data every 14 seconds. We call this consented-to data 'pristine'. The transformation process blows away any sense that this data remains pristine. If the transformation process is changing the data, is it still under consensus? We think not.

6. The third process, loading, poses a third threat. Because the organization providing the data takes on an ever-more increasing burden in order to serve an ever-increasing user base, they must increasingly take on costs.  users, users of the nodeis broken. It is broken because it does not have an index of addresses. This makes it impossible to get the transactional history of an address directly from the node.

7. Indexes and content-addressable data stores such as IPFS do not play well together. This leads to directly to centralized (and old-fashioned) Web 2.0 data access through blockchain explorers which have already become the only way most users can get transactional histories of their own accounts. That's not decentralized.

8. If a single entity (or a small number of entities) becomes the only way for users to get their transactional histories, that entity will capture those users. This will happen either by the entity withholding the data and charging for access or (more likely) by giving the data away for free and return for much more lucritive payment through privacy invasion.

9.  To solve this problem, the Ethereum node needs to index the blockchain. TrueBlocks builds this missing index. However, we don't want to build it and be able to later control it or limit access to it. That's where IPFS comes in. We build a chunked index (that is, periodically we stop adding data to the growing chunk). This allows us to store the chunk immutably on IPFS.

10. Before storing the data, we add a bloom filter that covers the index chunk. We publish this immutable bloom filter to IPFS as well. The bloom filter is very small and speeds up the search of the chunked index by orders of magnitude.

11. Because end-user machines have small hard drives and we wish to permissionlessly and irrevocably distribute the index, TrueBlocks only downloads the much smaller bloom filters to the end users machine on first install. Subsequent queries for an address first check the bloom filter and only download the associated full index chunk of there's a hit on the bloom filter. In this way, each user downloads only the portion of the index that is of interest to them.

12. Those who say it is impossible to index the Ethereum blockchain on small, desktop machines are wrong.

13. Indexing the Ethereum blockchain by address turns the broken Ethereum node into a very performant server able to be run under a fully local environment. This is because once one knows which transactions to query, the node itself delivers that data quite quickly. Furthermore, TrueBlocks has a built-in client side cache which further speeds up access to the data.

14. TrueBlocks turns a local Ethereum node into a performant data server for end user applications. TrueBlocks dApps are unique, *very fast*, fully-decentralized and distributed applications (that is, they are TRUE dApps). This is how we all thought things should work -- software completely local to the end user's machine with zero web servers snooping on the user's activity.
