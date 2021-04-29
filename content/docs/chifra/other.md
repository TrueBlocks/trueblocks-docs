---
title: "Other"
description: ""
lead: ""
date: 2021-04-29T09:18:48-03:00
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

## chifra slurp

`chifra slurp` is one of our older command line tools. It even has its [own website](http://ethslurp.com) and [video tutorial](https://www.youtube.com/w atch?v=ZZDV1yAgces). While this tool is very useful, it has two significant flaws. First, it is not decentralized--in fact it is fully centralized, pulling its data from [http://etherscan.io](http://etherscan.io) as it does. The tool's second major flaw is that it does not pull every transaction from the chain for a given account as our [account monitors](../../monitors/README.md) do. This is because of `internal transactions` which, believe us, is too complicated to be worth taking the time to explain.

While `chifra slurp` does have its shortcomings, it also provides some nice features. You can use it to pull all externally generated transactions against an account. You may also use the tool's fully customizable formatting options to export data into any format you wish. Visit the above referenced website for more information.

#### Usage

`Usage:`    chifra slurp [-t|-p|-v|-h] &lt;address&gt; [address...] [block...]  
`Purpose:`  Fetches data from EtherScan for an arbitrary address.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | one or more addresses to slurp from Etherscan (required) |
|  | blocks | an optional range of blocks to slurp |
| -t | --types <val> | one or more types of transactions to request, one or more of [ext*&#124;int&#124;token&#124;nfts&#124;miner&#124;all] |
| -p | --appearances | show only the blocknumer.tx_id appearances of the exported transactions |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- Portions of this software are Powered by Etherscan.io APIs.

#### Other Options

All **TrueBlocks** command-line tools support the following commands (although in some case, they have no meaning):

    Command     |     Description
    -----------------------------------------------------------------------------
    --version   |   display the current version of the tool
    --nocolor   |   turn off colored display
    --wei       |   specify value in wei (the default)
    --ether     |   specify value in ether
    --dollars   |   specify value in US dollars
    --raw       |   report JSON data from the node with minimal processing
    --very_raw  |   report JSON data from node with zero processing
    --fmt       |   export format (where appropriate). One of [none|txt|csv|json|api]
    --to_file   |   write the results to a temporary file and return the filename
    --output:fn |   write the results to file 'fn' and return the filename
    --file:fn   |   specify multiple sets of command line options in a file.

<small>*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.*</small>

**Source**: [`tools/ethslurp`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/ethslurp)

## chifra quotes

The `chifra quotes` tool provides Ethereum price data to various tools or for other purposes. Currently, `chifra quotes` retrieves data using the Poloniex API. In future versions, we intend to add other sources of pricing data and provide a mechanism to specify an averaging calculate given multiple price sources. Ultimately, we hope Ethereum/fiat price data appears under consensus, but until that time, **TrueBlocks** uses `chifra quotes`. Powered, in part, by Poloniex<sup>&reg;<sup>
#### Usage

`Usage:`    chifra quotes [-f|-p|-a|-e|-v|-h]  
`Purpose:`  Freshen and/or display Ethereum price data.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
| -f | --freshen | Freshen price database (append new data) |
| -p | --period <val> | increment of display, one of [5&#124;15&#124;30&#124;60&#124;120*&#124;240&#124;1440&#124;10080&#124;hourly&#124;daily&#124;weekly] |
| -a | --pair <str> | which price pair to freshen or list (see Poloniex) |
| -e | --feed <val> | the feed for the price data, one of [poloniex*&#124;maker&#124;tellor] |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- Valid pairs include any pair from the public Poloniex's API here: 
  https://poloniex.com/public?command=returnCurrencies.
- `Note`: Due to restrictions from Poloniex, this tool retrieves only 30 days of data 
  at a time. You must repeatedly run this command until the data is up-to-date.


**Source**: [`tools/ethQuote`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/ethQuote)

## chifra where

`chifra where` reports on the location of a block (or blocks) in the cache. It reports on one of three situations: `cache`, `node` or `none` depending on where the block is found.

If `chifra where` finds the block in the TrueBlocks cache, it reports the path to that block's file. If the block is not in the cache, but there is a locally running node, `chifra where` returns `node` plus the name and version info from the running node. Otherwise, `chifra where` returns `none`.

This tool is intended mostly as an aid in developing and debugging TrueBlocks tools.

### Usage

`Usage:`    chifra where [-v|-h] &lt;block&gt; [block...]  
`Purpose:`  Reports in which cache (if any) a block is found.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | blocks | a space-separated list of one or more blocks to search for (required) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- Customize the location of the cache in the configuration file $CONFIG/trueBlocks.toml.

**Source**: [`tools/whereBlock`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/whereBlock)

