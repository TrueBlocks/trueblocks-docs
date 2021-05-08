---
title: "Admin"
description: ""
lead: ""
date: 2021-05-08T01:31:44
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
weight: 40
toc: true
---
## intro
The Admin section of commands allows you to get the status of the system as well as control the creation of and sharing of the TrueBlocks index of appearances. It also provides a mechanism for serving the `chifra` subcommands as API endpoints.
## chifra init

`chifra list` takes one or more addresses, queries the index of appearances, and builds a TrueBlocks 'monitor'. A monitor is a file that represents your interest in those particular addresses. The first time you create a monitor takes a few minutes, but the information is cached, so subsequent queries are much faster.

Note that `chifra list` does not extract transactional data from the chain. This is accomplished with `chifra export`. In fact, `chifra list` is just a shortcut of the command `chifra export --appearances` and may be used interchangably.

### usage

`Usage:`    chifra list &lt;address&gt; [address...]  
`Purpose:`  List appearances for the given address(es).

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | one or more addresses (0x...) to export (required) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.

**Source code**: [`apps/acctExport`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/acctExport)
## chifra status

The `chifra status` program allows one to  manage and explore [monitor cache files](../../monitors/README.md). You may list cache entries, check for duplicate or invalid cache entries (and optionally remove them). Use the tool with caution and please make sure to backup your data before proceeding.

### usage

`Usage:`    chifra status [-d|-t|-v|-h] &lt;mode&gt; [mode...]  
`Purpose:`  Report on status of one or more TrueBlocks caches.

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
|  | modes | the type of status info to retrieve, one or more of *[ index \| monitors \| entities \| names \| abis \| caches \| some\* \| all ]* |
| -d | --details | include details about items found in monitors, slurps, abis, or price caches |
| -t | --types <val> | for cache mode only, which type(s) of cache to report, one or more of *[ blocks \| transactions \| traces \| slurps \| prices \| all\* ]* |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

**Source code**: [`apps/cacheStatus`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/cacheStatus)

## chifra scrape

The `chifra scrape` app queries the rpcProvider you specify (or your local node if none) using the RPC interface reading each block from any EVM-based blockchain. After extensive optimizations to the data, including <img width=500px align="right" src="docs/image.png"> determining each transaction's error status and expanding internal message calls, the blocks are stored in a speed-optimized database for fast retrieval. By doing as much work as possible prior to storage, TrueBlocks is able to achieve significant increases in speed of retrieval over the node.

Using operating system tools such as Linux's `cron` you can easily maintain a  constantly fresh TrueBlocks database. Using TrueBlocks `display strings` technology, it is even easy to populate a regular web 2.0 database and from there a full featured website representing the full state of your smart contract.

### usage

`Usage:`    chifra scrape [-t|-n|-p|-s|-i|-R|-v|-h] mode  
`Purpose:`  Decentralized blockchain scraper and block cache.

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
|  | mode | control the block and account scrapers, one of *[ run \| quit \| pause \| restart ]* (required) |
| -t | --tool <val> | process the index, monitors, or both (none means process timestamps only), one or more of *[ monitors \| index\* \| none \| both ]* |
| -n | --n_blocks <num> | maximum number of blocks to process (defaults to 5000) |
| -p | --pin | pin new chunks (and blooms) to IPFS (requires Pinata key and running IPFS node) |
| -s | --sleep <double> | the number of seconds to sleep between passes (default 14) |
| -i | --cache_txs | write transactions to the cache (see notes) |
| -R | --cache_traces | write traces to the cache (see notes) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

**Source code**: [`apps/blockScrape`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/blockScrape)

## chifra serve

`chifra list` takes one or more addresses, queries the index of appearances, and builds a TrueBlocks 'monitor'. A monitor is a file that represents your interest in those particular addresses. The first time you create a monitor takes a few minutes, but the information is cached, so subsequent queries are much faster.

Note that `chifra list` does not extract transactional data from the chain. This is accomplished with `chifra export`. In fact, `chifra list` is just a shortcut of the command `chifra export --appearances` and may be used interchangably.

### usage

`Usage:`    chifra list &lt;address&gt; [address...]  
`Purpose:`  List appearances for the given address(es).

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | one or more addresses (0x...) to export (required) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.

**Source code**: [`apps/acctExport`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/acctExport)
## chifra pins

The `chifra pins` is not ready for prime time. Please return late.

### usage

`Usage:`    chifra pins [-c|-i|-f|-s|-v|-h]  
`Purpose:`  Report on and manage the remotely pinned appearance index and associated bloom filters.

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
| -c | --compare | report differences (if any) between the manifest and pinning service |
| -i | --init | initialize the local index by downloading bloom filters from the pinning service |
| -f | --freshen | freshen the manifest from the hash found at the smart contract |
| -s | --sleep <double> | the number of seconds to sleep between requests during init (default .25) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

**Source code**: [`apps/pinMan`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/pinMan)

