---
title: "2. Get the index"
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
alias:
 - "/docs/prologue/how-can-i-get-the-index"
images: []
menu: 
  docs:
    parent: install
weight: 550	
toc: true
---

| If you want to...                                                                                                                    | and you don't mind...                                                                                                                          | then use...                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| minimize the size of the data stored locally and you want to get started faster...                                                   | slower first-time queries on new addresses, an index that's slightly behind the head of the chain, an index created by someone else...         | [`chifra init`](#use-init-to-get-only-the-chunks-you-query)       |
| maximize the speed of first-time queries for new addresses...                                                                        | longer initial setup time, ~70 GB of local storage, an index that's slightly behind the head of the chain, an index created by someone else... | [`chifra pins --init_all`](#use_init_all-to-get-all-index-chunks) |
| have a fully-local index, built directly from your own node, that stays up with the chain and maximizes the speed of your queries... | two to three days setup time and running your own local node (such as dAppnode)....                                          | [`chifra scrape`](#use-scrape-to-build-your-own-index)            |

## Getting the index without running a node

If you're not running your own node (or you don't feel like waiting), you can download all or part of a pre-built index from IPFS.

To do this, you have two options:

- run `chifra init` to download only the Bloom filters. Then, as you query individual addresses, TrueBlocks will download the much-larger index chunks (_faster now, slower later_)
- run `chifra pins --init_all` to download both the Bloom filters and the index chunks all at once (_slower now, faster later_)

### Use chifra init to get a subset of the data

To get only the Bloom filters, run `chifra init`.

If you do this, you will have to periodically re-run the command to update your index. ([Read about the finding the latest manifest](#Supplementary-how-can-I-see-when-the-manifest-was-last-published)).

For more information, see the [`chifra init` command documentation](../../chifra/admin.md#chifra-init).

**Initial set up time**: `chifra init` takes only about a half an hour on a machine with a good connection. (We've had report from some users that it takes much longer, but we suspect they are on slow machines.) We highly prefer you have a capable machine.

**Storage use**: In this scenario, since you only download the Bloom filters, the space required is about 1GB. Subsequently, as you download individual chunk, each chunk occupies about 25MB.

The number of index chunks you download depends entirely on the addresses you query. Of course, if you query a lightly used address, very few chunks will be downloaded. However, if you query are heavily used address, such as UniSwap, nearly every chunk will be downloaded. This is by design. In the later case, you would probably be better off using `chifra pins --init_all` to begin with.

- For typical addresses (e.g. personal accounts), storage is somewhere between 50 to 500 MB
- For more active addresses, storage may be as much as 1 or 2 GB
- For very popular smart contracts, the storage requirement may be as high as 50 GB

**How it works**

When you run `chifra init`, TrueBlocks downloads a set of Bloom filters from the latest published manifest to your local machine. Subsequently, when you want to explore an address history, e.g. with the command `chifra export <address>`, TrueBlocks:

1. Scans the Bloom filters for potential matches and if there's a hit, downloads the corresponding index chunks.
2. Returns the set of `appearances` for the address as pairs of `<block number>` and `<transaction_id>`. (This permits direct queries for exact details of desired transaction histories).
3. Given the list of `appearances`, TrueBlocks pulls the full transacitonal history of the account from any (remote or local) RPC endpoint.
4. During the query, you may instruct TrueBlocks to cache the response locally, making future queries for this same address nearly instantaneous.

### Use chifra pins --init_all to get the entirity of the index

To get the entirety of the appearance index, run `chifra pins --init_all`.

If you use this command and don't run `chifra scrape`, you will have to update the index periodically by running the command again. ([Read about the finding the latest manifest](#Supplementary-how-can-I-see-when-the-manifest-was-last-published)).

For detailed instructions, see the [`chifra pins`] documentation(../../chifra/admin#chifra-pins).

**Initial set up time**: Somewhere between six and ten hours depending on the speed of your connection.

**Storage use**: About 60GB-80GB

**How it works**

The initialization is very similar to the `init` process described in the previous section.

However, while `chifra init` downloads only the Bloom filters, downloading the index chunks only after a user queries for an address, `chifra pins --init_all` _downloads all index chunks up front_.

While this process takes much longer (perhaps hours), when you query a particular address in the future, TrueBlocks no longer has to download anything.
Therefore, the query is significantly faster.
In other words, the first time you run `chifra export <transaction>`, the process is much faster than it is if you initialize with `chifra init` alone.

As is true of the previous methods, if you enable caching, subsequent queries for the same address return almost instantly.

## Use chifra scrape to build your own index


> 👉 **Note**:
> If you don't have a node with tracing or archiving, `scrape` exits by default.
> You can still use scrape, but you need to
<a href="../install-trueblocks#no-tracing">open your config and disable these checks</a></p>

To build your own index without any downloading, run `chifra scrape`.

For detailed instructions, see the [`chifra scrape` command documentation](../../chifra/admin#chifra-scrape).

**Initial set up time**: This method requires a locally-running tracing / archive node such as dAppNode running Erigon. Early users have reported 2-4 days to build the index from scratch. (You may wish to run `chifra scrape` in an application like `tmux`, so you can close the terminal window while it builds.)

**Storage use**: About 60GB.

**How it works**:

The end result of `chifa scrape` is the same as the end result of `chifra pins --init_all`. However, the process is crucially different: rather than downloading the index that we publish (that is, trusting us), `chifra scrape` _builds the index on your local machine connecting only with your local-running RPC endpoint_, which means if you trust your own setup, you can trust the data.

(One note: It's possible to run against any RPC endpoint -- remote or local -- but because the TrueBlocks scraper hits the node continually and very aggressively, you will probably get rate-limited against a shared RPC server such as Infura.)

A good explanation of this whole process requires a long form article. For now, the curious may look at the best documentation available, the `src` directory of the source code.


## One final note on building / making the index

You can, if you wish, mix and match the above methods.

For example, you can initially download only the Bloom filters with `chifra init` and then start up `chifra scrape` in the background. This would allow you to get started quickly but stay up to the front of the chain. Of course, as with everything, there's a tradeoff. You will be storing a few MB every time a new chunk is created (about three times a day). In return, it's way faster to query and the index stay up to the chain.

Alternatively, you may choose to scrape (i.e. build) the index yourself and share it with others by pinning it on IPFS. In this case, you're being a good citizen and making the whole ecosystem better off because you're sharing you index.

You can download the index (either with `chifra init` or `chifra pins --init_all`) and pin that data (with the `--pin_locally` flag) as a way to share with the community, and then turn on the scraper. All options are available as a way to maximize the usefulness of the tool.

## Supplementary: how can I see when the manifest was last published?

If you are using one of the `init` options, you may wish to know how 'fresh' your index is.

TrueBlocks tries to publish the manifest frequently (weekly?), but you can always check. The eventual goal of to publish the manifest each time a new chunk is produced (about two or three times a day). But this is `gas-expensive`, so we would need to secure funding for that process. We welcome donations, peers and alternative indexers to participate!.

You can find the most [recent manifest here](https://etherscan.io/address/0xcfd7f3b24f3551741f922fd8c4381aa4e00fc8fd#readContract). (Open the `manifestHash` record.)

Each pin has a given block range, which you can check yourself using `chifra`.

For example, see the last manifest record by running

```shell
chifra pins --list | tail -n 1
```

This outputs something like this:

```
012909804-012912694     QmSQvJ5GPyc8juthKgvMaonxm2t2m939MphyMhBRuHKJzt  QmVCZdXD9EMU9jR6HKp8V1bC74DQDCzGurLxnK6KnbV2LP
```

The first field of the output provides the block range for the latest chunk. So, you could see when the last block of the latest
range was published by running `chifra when` on the last record:

```shell
$chifra when 012912694
blocknumber     timestamp       date    name
12912694        1627451435      2021-07-28 05:50:35 UTC
```
