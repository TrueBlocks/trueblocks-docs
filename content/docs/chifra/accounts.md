---
title: "Accounts"
description: ""
lead: ""
date: 2021-05-07T09:05:57
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
weight: 10
toc: true
---
## Intro
This group of commands is the heart of TrueBlocks. They allow you to work with Ethereum addresses (or, as we call them, accounts). You may name addresses; grab the ABI file for an address; add, delete, clean or delete accounts, and especially list or export the transactions related to an address.
## chifra export

This folder contains a TrueBlocks monitor. TrueBlocks monitors pull transactions from the Ethereum blockchain for a given (or a series of) Ethereum addresses.

Below we present the command line interface to this tool, although the tool itself is not available under open source. While the tool is in active development, TrueBlocks monitors already produce very useful results. For example, we use TrueBlocks monitors to account for and analyze all transactions on a given smart contract. We present [this example](http://dao.quickblocks.io).

Please contact us at [sales@greathill.com](mailto:sales@greathill.com) for more information.

### usage

`Usage:`    chifra export [-p|-r|-l|-t|-C|-O|-a|-i|-R|-U|-v|-h] &lt;address&gt; [address...] [topics] [fourbytes]  
`Purpose:`  Export full detail of transactions for one or more Ethereum addresses.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | one or more addresses (0x...) to export (required) |
|  | topics | filter by one or more logs topics (only for --logs option) |
|  | fourbytes | filter by one or more fourbytes (only for transactions and trace options) |
| -p | --appearances | export a list of appearances |
| -r | --receipts | export receipts instead of transaction list |
| -l | --logs | export logs instead of transaction list |
| -t | --traces | export traces instead of transaction list |
| -C | --accounting | export accounting records instead of transaction list |
| -O | --tokens | export accounting for ERC 20 tokens (assumes ETH accounting as above) |
| -a | --articulate | articulate transactions, traces, logs, and outputs |
| -i | --cache_txs | write transactions to the cache (see notes) |
| -R | --cache_traces | write traces to the cache (see notes) |
| -U | --count | only available for --appearances mode, if present return only the number of records |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.

**Source code**: [`apps/acctExport`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/acctExport)

## chifra names

`chifra names` lists the addresses found in your local node's keystore. It can be used to report your ether holdings, for example. It also lists known, named accounts from [chifra names](../ethName/README.md).

One way to use this tool is to feed its output through the [chifra state](../getState/README.md) or [chifra tokens](../getTokens/README.md). This will give you the balances of your ether holdings or token holings. For example, you can do these commands:

List accounts held in the local node's keystore:

    chifra names

List balances of those accounts (note 'xargs' puts the results on a single line):

    chifra state --mode balance `chifra names -a | xargs`
    
List balances of the local node's accounts in US dollars:

    chifra state --mode balance `chifra names -a | xargs` --dollars

Using chifra names to find Singular's address, list token balances held by your accounts:

    chifra tokens `chifra names -a singular` `chifra names | xargs`

Using chifra names to find Singular's address, list tokens held by other token accounts:

    chifra tokens `chifra names -a singular` `chifra names -n | xargs`

### usage

`Usage:`    chifra names [-e|-m|-l|-c|-p|-n|-a|-s|-g|-v|-h] &lt;term&gt; [term...]  
`Purpose:`  Query addresses and/or names of well known accounts.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | terms | a space separated list of one or more search terms (required) |
| -e | --expand | expand search to include all fields (default searches name, address, and symbol only) |
| -m | --match_case | do case-sensitive search |
| -l | --all | include all accounts in the search |
| -c | --custom | include your custom named accounts |
| -p | --prefund | include prefund accounts |
| -n | --named | include well know token and airdrop addresses in the search |
| -a | --addr | display only addresses in the results (useful for scripting) |
| -s | --entities | display entity data |
| -g | --tags | export the list of tags and subtags only |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- With a single search term, the tool searches both `name` and `address`.
- With two search terms, the first term must match the `address` field, and the second term must match the `name` field.
- When there are two search terms, both must match.
- The `--match_case` option requires case sensitive matching. It works with all other options.
- To customize the list of names add a `custom` section to the config file (see documentation).
- Name file: `$CONFIG/names/names.tab`

**Source code**: [`tools/ethNames`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/ethNames)

## chifra abis

`chifra abis` retrieves an ABI file either from a local cache, from the Ethereum Name Service (ENS), or from [Etherscan](http://etherscan.io). Once retrieved, `chifra abis` generates the classDefinition files needed by [makeClass](../makeClass/README.md) to generate a parselib for each [Ethereum address monitor](../../monitors/README.md).

### usage

`Usage:`    chifra abis [-c|-k|-f|-v|-h] &lt;address&gt; [address...]  
`Purpose:`  Fetches the ABI for a smart contract.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | list of one or more smart contracts whose ABI to grab from EtherScan (required) |
| -c | --canonical | convert all types to their canonical represenation and remove all spaces from display |
| -k | --known | load common 'known' ABIs from cache |
| -f | --find <str> | try to search for a function declaration given a four byte code |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- Solidity files found in the local folder with the name '<address>.sol' are converted to an ABI prior to processing (and then removed).

**Source code**: [`tools/grabABI`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/grabABI)

