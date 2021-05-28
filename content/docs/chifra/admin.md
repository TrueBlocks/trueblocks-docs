---
title: "Admin"
description: ""
lead: ""
date: 2021-05-08T01:35:20
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu: 
  docs:
    parent: "chifra"
weight: 1400
toc: true
---
With TrueBlocks' admin component, you can query the status of the system,
and control the creation, sharing , and pinning of the TrueBlocks index of appearances.

Through the `chifra serve` command, you can also serve `chifra` subcommands as API endpoints.
You test this out from your `localhost` on our [API reference](https://www.tokenomics.io/api.html).
## chifra status

The `chifra status` program allows you to manage the various TrueBlock caches. You may list all of the caches, some of the cache, or even individual caches either in terse or full detail. The cache of interest is specified with the `modes` option.

TrueBlocks maintains caches for the index of address appearances, named addresses, abi files, as well as other data including blockchain data, address monitors, and groups of address monitors called entities.

### usage

`Usage:`    chifra status [-d|-t|-v|-h] &lt;mode&gt; [mode...]  
`Purpose:`  Report on the status of the TrueBlocks system.

`Where:`  

| | Option | Description |
| :----- | :----- | :---------- |
|  | modes | the type of status info to retrieve, one or more of *[ index \| monitors \| entities \| names \| abis \| caches \| some\* \| all ]* |
| -d | --details | include details about items found in monitors, slurps, abis, or price caches |
| -t | --types &lt;val&gt; | for caches mode only, which type(s) of cache to report, one or more of *[ blocks \| transactions \| traces \| slurps \| prices \| all\* ]* |
| -v | --verbose | set verbose level (optional level defaults to 1) |
| -h | --help | display this help screen |

**Source code**: [`apps/cacheStatus`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/cacheStatus)

## chifra serve

`chifra serve` delivers a JSON API for each of the `chifra` commands along with each of its options. It does this through `flame` server which is written in Go.

[Get help with the API here](https://www.tokenomics.io/api.html
).

Another way to get help to run `chifra --help` or `chifra <cmd> --help` on your command line. See below for an example of converting command line options to a call to the API. There's a one-to-one correspondence between the command line tools and options and the API routes and their options.

### usage

`Usage:`    chifra serve  
`Purpose:`  Present each chifra command along with all of its options as a JSON api.

`Where:`  

| Short Cut | Option    | Description                                 |
| --------: | :-------- | :------------------------------------------ |
|           | --port    | specify the server's port (default ":8080") |
|        -v | --verbose | set verbose level (optional level defaults to 1)  |
|        -h | --help    | display this help screen                    |

`Notes:`

- To use the API, first open a new terminal window and run `chifra serve`
- Instead of the command line `chifra status index --details`, run `curl "http://localhost:8080/status?modes=index&details"`.
- Treat other commands similarly.

**Source code**: [`go-apps/flame`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/go-apps/flame)
## chifra scrape

The `chifra scrape` application creates TrueBlocks' index of address appearances -- the fundemental data structure of the entire system. It also, optionally, pins the index to IPFS.

`chifra scrape` is a long running process, therefore we advise you run it as a service or in terminal multiplexer such as `tmux`. It is possible to start and stop `chifra scrape` as needed, but doing so means the scraper needs to catch up to the front of the chain, a process that may take some time depending on how frequently the scraper is run. See below for a more in depth explanation of how the scraping process works and prerequisites for it proper operation.

The scraper can scrape either the index only, previously created monitors only, both, or neither. If you specify `none`, timestamps will be scraped but nothing else. If you're scraping monitors, you may tell the system to cache traces and transactions. This will speed up access, but take addition hard drive space. You may also adjust the speed of operation on different machines with the `--sleep` and `--n_blocks` options. Finally, you may choose to optionally `--pin` each new chunk to IPFS.

### usage

`Usage:`    chifra scrape [-t|-n|-p|-s|-i|-R|-v|-h] mode  
`Purpose:`  Scan the chain and update the TrueBlocks index of appearances.

`Where:`  

| | Option | Description |
| :----- | :----- | :---------- |
|  | mode | control the block and account scrapers, one of *[ run \| quit \| pause \| restart ]* (required) |
| -t | --tool &lt;val&gt; | process the index, monitors, or both (none means process timestamps only), one or more of *[ monitors \| index\* \| none \| both ]* |
| -n | --n_blocks &lt;num&gt; | maximum number of blocks to process (defaults to 5000) |
| -p | --pin | pin new chunks (and blooms) to IPFS (requires Pinata key and running IPFS node) |
| -s | --sleep &lt;double&gt; | the number of seconds to sleep between passes (default 14) |
| -i | --cache_txs | write transactions to the cache (see notes) |
| -R | --cache_traces | write traces to the cache (see notes) |
| -v | --verbose | set verbose level (optional level defaults to 1) |
| -h | --help | display this help screen |

### explainer

Each time `chifra scrape` runs, it begins at the last block it completed (plus one) and decends as deeply as it can into the block's data. (This is why we need a `--tracing` node.) As address appearances are encountered, the system adds the appearance to a binary index. Periodically (at the end of the block containing the 2,000,000th appearance), the system consolidates a **chunk**.

A **chunk** is a portion of the index containing approximately 2,000,000 records. As part of the consolidation, the scraper creates a bloom filter representing the chunk. The bloom filters are an order of magnitude or more smaller than the chunks. The system then pushes both the chunk and the bloom filter to IPFS. In this way, TrueBlocks creates an immutable, uncapturable index of appearances that can be used not only by TrueBlocks, but any member of the community who needs it. (Hint: we all need it.)

Users of the [TrueBlocks Explorer](https://github.com/TrueBlocks/trueblocks-explorer) (or any other software, for that matter) subsequently downloads the bloom filters, queries them to determine which **chunks** need to be downloaded to the user's machine and thereby build a historical list of transacitons for a given address. This is accomplished while imposing a minimum amount of data on the end user's machine.

In future versions of the software, we will pin these shared chunks and blooms on end user's machines. They need the data for the software to operate and sharing it makes all user's better off. A naturally-born network effect.

### prerequisites

`chifra scrape` does not work without an RPC endpoint to an Ethereum node. The software works without an `--archive` node, but it works significantly better with one. An additional requirement for the software to work properly is an RPC that provides OpenEthereum's `trace_` routines. We've tested with OpenEthereum and TurboGeth.

Please see [this article](.) for more information about running the scraper and building and sharing the index of appearances.


**Source code**: [`apps/blockScrape`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/blockScrape)

## chifra init

When invoked, `chifra init` looks at a smart contract called **The Unchained Index** ([0xcfd7f3b24f3551741f922fd8c4381aa4e00fc8fd](https://etherscan.io/address/0xcfd7f3b24f3551741f922fd8c4381aa4e00fc8fd)). From this smart contract, it extracts a data item called `manifestHash`. The `manifestHash` is an IPFS hash that points to a file (a manifest) that contains every previously pinned bloom filter and index chunk. TrueBlocks periodically publishes the manifest's hash to the smart contract. This makes the entire index both available for our software to use and impossible for us to withhold. Both of these aspects of the manifest are included by design.

If you stop `chifra init` before it finishes, it will pick up against where it left off the next time you run it.

Certain parts of the system (`chifra list` and `chifra export` for example) if you have not previously run `chifra init` or `chifra scrape`. You will be warned by the system until it's satified.

If you run `chifra init` and allow it to complete, the next time you run `chifra scrape`, it will start where `init` finished. This means that only the blooms will be stored on your hard drive. Subsequent scraping will produce both chunks and blooms, although you can, if you wish delete chunks that are not being used. You may periodically run `chifra init` if you prefer not to scrape.

### usage

`Usage:`    chifra init  
`Purpose:`  Leech the bloom filters from IPFS by first downloading the pin manifest from a smart contract and then downloading the blooms. Optionally `--pin` the resulting download in order to share it with others.

*[The --pin option is currently disabled.]*

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
| -v | --verbose | set verbose level (optional level defaults to 1) |
| -h | --help | display this help screen |

**Source code**: [`apps/pinMan`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/pinMan)
## chifra pins

This tool is not yet ready for production use. Please return to this page later.

### usage

`Usage:`    chifra pins [-l|-i|-k|-p|-v|-h]  
`Purpose:`  Manage pinned index of appearances and associated bloom filters.

`Where:`  

| | Option | Description |
| :----- | :----- | :---------- |
| -l | --list | list the index and bloom filter hashes from local manifest or pinning service |
| -i | --init | initialize local index by downloading bloom filters from pinning service |
| -k | --init_all | initialize local index by downloading both bloom filters and index chunks |
| -p | --pin_locally | pin all local files in the index to an IPFS store (requires IPFS) |
| -v | --verbose | set verbose level (optional level defaults to 1) |
| -h | --help | display this help screen |

`Notes:`

- One of `--list`, `--init`, or `--init_all` is required.
- the `--pin_locally` option only works if the IPFS executable is in your path.

**Source code**: [`apps/pinMan`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/pinMan)

