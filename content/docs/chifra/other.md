---
title: "Other"
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
weight: 50
toc: true
---
## intro

This section of commands provides other useful tools such as a rudimentary pricing tool, a quick way to open a blockchain explorer, and an older tool called `ethslurp` which can help you compare our results (favorabily) with EtherScan's.
## chifra quotes

The `chifra quotes` tool provides USD ($) price data to other tools and to the command line. Currently, `chifra quotes` retrieves its price data from the Poloniex API. In future versions, we will add other sources and provide a mechanism for fair averaging. Ultimately, as more of this type of price data becomes available on chain, we will use those source, but this is not yet implemented.

### usage

`Usage:`    chifra quotes [-f|-p|-a|-e|-v|-h]  
`Purpose:`  Freshen and/or display Ethereum price data.

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
| -f | --freshen | Freshen price database (append new data) |
| -p | --period <val> | increment of display, one of *[ 5 \| 15 \| 30 \| 60 \| 120\* \| 240 \| 1440 \| 10080 \| hourly \| daily \| weekly ]* |
| -a | --pair <str> | which price pair to freshen or list (see Poloniex) |
| -e | --feed <val> | the feed for the price data, one of *[ poloniex\* \| maker \| tellor ]* |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- Valid pairs include any pair from the public Poloniex's API here: 
  https://poloniex.com/public?command=returnCurrencies.
- Due to restrictions from Poloniex, this tool retrieves only 30 days of data 
  at a time. You must repeatedly run this command until the data is up-to-date.

**Source code**: [`tools/getQuotes`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getQuotes)

## chifra explore

`chifra explore` opens Etherscan (and other explorers -- including our own) to the block, transaction hash, or address you specify. It's a handy way to open EtherScan from the command line, nothing more.

### usage

`Usage:`    chifra explore [ address | tx_hash | block_num ]  
`Purpose:`  Opens Etherscan to either an address, a transaction hash, or a block number.

`Where:`  

| Hotkey | Option | Description |
| -------: | :------- | :------- |
|  | addrs | an Ethereum address |
|  | tx_hash | a 32-byte transaction hash |
|  | block_num | a block number |
| -h | --help | display this help screen |

`Notes:`

- An `address` must start with '0x' and be forty-two characters long.
- A `tx_hash` must start with '0x' and be sixty-six characters long.
- If a hash is provided, it is assumed to be a transaction hash.
## chifra slurp

`chifra slurp` is the first tool we built in the Ethereum space. It even has its [own website](http://ethslurp.com).

While it's useful, it has two shortcomings. First, it is fully centralized, pulling its data from [http://etherscan.io](http://etherscan.io). Second, is that it does not report every transaction for a given account. This is actually a shortcoming with EtherScan. It's too complicated to explain here, but see our blog.

While `chifra slurp` has its shortcomings, it does provides some nice features. You may use it to pull any transaction initiated by an EOA for example or to explore mining rewards. Visit the above referenced website for more information.

### usage

`Usage:`    chifra slurp [-t|-p|-v|-h] &lt;address&gt; [address...] [block...]  
`Purpose:`  Fetches data from EtherScan for an arbitrary address.

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
|  | addrs | one or more addresses to slurp from Etherscan (required) |
|  | blocks | an optional range of blocks to slurp |
| -t | --types <val> | one or more types of transactions to request, one or more of *[ ext\* \| int \| token \| nfts \| miner \| all ]* |
| -p | --appearances | show only the blocknumer.tx_id appearances of the exported transactions |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- Portions of this software are Powered by Etherscan.io APIs.

**Source code**: [`tools/ethslurp`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/ethslurp)

