---
title: "Chifra"
description: ""
lead: ""
date: 2021-04-15T21:57:14-03:00
lastmod: 2021-04-15T21:57:14-03:00
draft: false
images: []
menu: 
  docs:
    parent: "tools"
toc: true
---
## Monitors
## chifra export

This folder contains a TrueBlocks monitor. TrueBlocks monitors pull transactions from the Ethereum blockchain for a given (or a series of) Ethereum addresses.

Below we present the command line interface to this tool, although the tool itself is not available under open source. While the tool is in active development, TrueBlocks monitors already produce very useful results. For example, we use TrueBlocks monitors to account for and analyze all transactions on a given smart contract. We present [this example](http://dao.quickblocks.io).

Please contact us at [sales@greathill.com](mailto:sales@greathill.com) for more information.

#### Usage

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

**Source**: [`apps/acctExport`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/acctExport)

## Shared Data
## chifra names

`chifra names` lists the addresses found in your local node's keystore. It can be used to report your ether holdings, for example. It also lists known, named accounts from [chifra names](../ethName/README.md).

One way to use this tool is to feed its output through the [chifra state](../getState/README.md) or [chifra tokens](../getTokenInfo/README.md). This will give you the balances of your ether holdings or token holings. For example, you can do these commands:

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

#### Usage

`Usage:`    chifra names [-e|-m|-l|-o|-c|-p|-n|-a|-s|-g|-v|-h] &lt;term&gt; [term...]  
`Purpose:`  Query addresses and/or names of well known accounts.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | terms | a space separated list of one or more search terms (required) |
| -e | --expand | expand search to include all fields (default searches name, address, and symbol only) |
| -m | --match_case | do case-sensitive search |
| -l | --all | include all accounts in the search |
| -o | --owned | include personal accounts in the search |
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

**Source**: [`tools/ethNames`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/ethNames)

## chifra abis

`chifra abis` retrieves an ABI file either from a local cache, from the Ethereum Name Service (ENS), or from [Etherscan](http://etherscan.io). Once retrieved, `chifra abis` generates the classDefinition files needed by [makeClass](../makeClass/README.md) to generate a parselib for each [Ethereum address monitor](../../monitors/README.md).

#### Usage

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

**Source**: [`tools/grabABI`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/grabABI)

## Blockchain data
## chifra blocks

The `chifra blocks` tool retrieves Ethereum block data from a running node or, if previously retrieved, the TrueBlocks cache. It optionally retrieves the hashes that denote the transactions in the block or the full transactional data as a default.

The tool may also be used to double check that the results produced from the TrueBlocks cache and the results as retrieved directly from the running node are identical (modulo the fact that TrueBlocks does not store every data field from the node). You may accomplish this `check` with the --check option.

#### Usage

`Usage:`    chifra blocks [-e|-a|-u|-n|-c|-U|-v|-h] &lt;block&gt; [block...]  
`Purpose:`  Returns block(s) from local cache or directly from a running node.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | blocks | a space-separated list of one or more blocks to retrieve (required) |
| -e | --hashes_only | display only transaction hashes, default is to display full transaction detail |
| -a | --apps | display all address appearances included in the block |
| -u | --uniq | display only uniq addresses found per block |
| -n | --uniq_tx | display only uniq addresses found per transaction |
| -c | --count | display counts of appearances (for --apps, --uniq, or --uniq_tx) or transactions |
| -U | --uncles | display uncle blocks (if any) instead of the requested block |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `blocks` is a space-separated list of values, a start-end range, a `special`, or any combination.
- `special` blocks are detailed under `whenBlock --list`.

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

**Source**: [`tools/getBlock`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getBlock)

## chifra transactions

The `chifra transactions` tool retrieves transactions from the running Ethereum node (using the `--raw` option) or from TrueBlocks (the default). You may provide a transaction `hash`, a `blockNumber.transactionID` pair, or a `blockHash.transactionID` pair (or any combination) to specify the transaction(s).

#### Usage

`Usage:`    chifra transactions [-a|-t|-u|-v|-h] &lt;tx_id&gt; [tx_id...]  
`Purpose:`  Retrieve a transaction from the cache or the node.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | transactions | a space-separated list of one or more transaction identifiers (tx_hash, bn.txID, blk_hash.txID) (required) |
| -a | --articulate | articulate the transactions if an ABI is found for the 'to' address |
| -t | --trace | display the transaction's trace |
| -u | --uniq | display a list of uniq addresses found in this transaction |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `transactions` is one or more space-separated identifiers which may be either a transaction hash, 
  a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
- This tool checks for valid input syntax, but does not check that the transaction requested exists.
- If the queried node does not store historical state, the results are undefined.

*See Also*: This command-line tool implements these RPC interfaces:
[eth_getTransactionByHash](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyhash),
[eth_getTransactionByBlockNumberAndIndex](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblocknumberandindex),
[eth_getTransactionByBlockHashAndIndex](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblockhashandindex).

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

**Source**: [`tools/getTrans`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getTrans)

## chifra receipts

`chifra receipts` returns a transaction's receipt. You may specify the logs you want using either a transaction hash (trans\_hash), a block hash plus transaction index (block\_hash.trans\_id), or a block number plus transaction index (block\_num.trans\_id).  

#### Usage

`Usage:`    chifra receipts [-a|-l|-v|-h] &lt;tx_id&gt; [tx_id...]  
`Purpose:`  Retrieve a transaction's receipt from the cache or the node.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | transactions | a space-separated list of one or more transaction identifiers (tx_hash, bn.txID, blk_hash.txID) (required) |
| -a | --articulate | articulate the transactions if an ABI is found for the 'to' address |
| -l | --logs | display the receipt's logs |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `transactions` is one or more space-separated identifiers which may be either a transaction hash, 
  a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
- This tool checks for valid input syntax, but does not check that the transaction requested exists.
- If the queried node does not store historical state, the results may be undefined.

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

**Source**: [`tools/getReceipt`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getReceipt)

## chifra logs

`chifra logs` returns a transaction's logs. You may specify the logs you want using either a transaction hash (trans\_hash), a block hash plus transaction index (block\_hash.trans\_id), or a block number plus transaction index (block\_num.trans\_id).  

#### Usage

`Usage:`    chifra logs [-a|-v|-h] &lt;tx_id&gt; [tx_id...]  
`Purpose:`  Retrieve a transaction's logs from the cache or the node.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | transactions | a space-separated list of one or more transaction identifiers (tx_hash, bn.txID, blk_hash.txID) (required) |
| -a | --articulate | articulate the transactions if an ABI is found for the 'to' address |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `transactions` is one or more space-separated identifiers which may be either a transaction hash, 
  a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
- This tool checks for valid input syntax, but does not check that the transaction requested exists.
- If the queried node does not store historical state, the results may be undefined.

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

**Source**: [`tools/getLogs`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getLogs)

## chifra traces

`chifra traces` returns a transaction's traces. You may specify the logs you want using either a transaction hash (trans\_hash), a block hash plus transaction index (block\_hash.trans\_id), or a block number plus transaction index (block\_num.trans\_id).  

#### Usage

`Usage:`    chifra traces [-a|-d|-c|-v|-h] &lt;tx_id&gt; [tx_id...]  
`Purpose:`  Retrieve a transaction's traces from the cache or the node.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | transactions | a space-separated list of one or more transaction identifiers (tx_hash, bn.txID, blk_hash.txID) (required) |
| -a | --articulate | articulate the transactions if an ABI is found for the 'to' address |
| -d | --statediff | export stateDiff traces for the transaction(s) |
| -c | --count | show the number of traces for the transaction only (fast) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `transactions` is one or more space-separated identifiers which may be either a transaction hash, 
  a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
- This tool checks for valid input syntax, but does not check that the transaction requested exists.
- If the queried node does not store historical state, the results are undefined.

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

**Source**: [`tools/getTrace`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getTrace)

## chifra state

Retrieve the balance (in wei) of an address (or list of addresses) at a given block(s). You may specify multiple addresses and/or multiple blocks, but you must specify at least one address.

This simple program may be used to query an Ethereum address to determine if it is a `smart contract` or simply a regular `external account`. It may also be used to retrieve the byte-code from an address (if present). Finally, it may be used to compare the byte code found at two addresses to determine if they hold identical code. You may specify multiple addresses on a line.

#### Usage

`Usage:`    chifra state [-p|-c|-n|-v|-h] &lt;address&gt; [address...] [block...]  
`Purpose:`  Retrieve the balance of one or more address at the given block(s).

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | one or more addresses (0x...) from which to retrieve balances (required) |
|  | blocks | an optional list of one or more blocks at which to report balances, defaults to 'latest' |
| -p | --parts <val> | control which state to export, one or more of [none&#124;some*&#124;all&#124;balance&#124;nonce&#124;code&#124;storage&#124;deployed&#124;accttype] |
| -c | --changes | only report a balance when it changes from one block to the next |
| -n | --no_zero | suppress the display of zero balance accounts |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.
- `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
- If the queried node does not store historical state, the results are undefined.
- `special` blocks are detailed under `whenBlock --list`.
- `balance` is the default mode. To select a single mode use `none` first, followed by that mode.
- You may specify multiple `modes` on a single line.

`See Also`: This command-line tool implements the [eth_getCode](https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcode) RPC interface.

#### Usage

`Usage:`    chifra state [-p|-c|-n|-v|-h] &lt;address&gt; [address...] [block...]  
`Purpose:`  Retrieve the balance of one or more address at the given block(s).

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | one or more addresses (0x...) from which to retrieve balances (required) |
|  | blocks | an optional list of one or more blocks at which to report balances, defaults to 'latest' |
| -p | --parts <val> | control which state to export, one or more of [none&#124;some*&#124;all&#124;balance&#124;nonce&#124;code&#124;storage&#124;deployed&#124;accttype] |
| -c | --changes | only report a balance when it changes from one block to the next |
| -n | --no_zero | suppress the display of zero balance accounts |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.
- `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
- If the queried node does not store historical state, the results are undefined.
- `special` blocks are detailed under `whenBlock --list`.
- `balance` is the default mode. To select a single mode use `none` first, followed by that mode.
- You may specify multiple `modes` on a single line.

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

**Source**: [`tools/getState`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getState)

## chifra tokens

Given the address of an ERC20 token contract, report token balances for one or more accounts. Alternatively, report token balances for multiple ERC20 contracts for a single account.

In normal operation the **first item** in the `address_list` is considered to be an ERC20 token contract whose balances are queried, whereas the remainder of the list is assumed to be accounts on which to report.

In `--byAcct` mode, **all items** in the `address_list` are assumed to be token contracts, except the last which is the account whose token balances are reported.

You may optionally specify one or more blocks at which to report.

#### Usage

`Usage:`    chifra tokens [-p|-b|-n|-v|-h] &lt;address&gt; &lt;address&gt; [address...] [block...]  
`Purpose:`  Retrieve token balances for one or more address at given block(s).

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | addrs | two or more addresses (0x...), the first is an ERC20 token, balances for the rest are reported (required) |
|  | blocks | an optional list of one or more blocks at which to report balances, defaults to 'latest' |
| -p | --parts <val> | one or more parts of the token information to retreive, one or more of [name&#124;symbol&#124;decimals&#124;totalSupply&#124;version&#124;none&#124;all*] |
| -b | --by_acct | consider each address an ERC20 token except the last, whose balance is reported for each token |
| -n | --no_zero | suppress the display of zero balance accounts |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.
- `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
- If the token contract(s) from which you request balances are not ERC20 compliant, the results are undefined.
- If the queried node does not store historical state, the results are undefined.
- `special` blocks are detailed under `whenBlock --list`.

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

**Source**: [`tools/getTokenInfo`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getTokenInfo)

## chifra when

The `chifra when` tool answers one of two questions: (1) "At what date and time did a given block occur?" or (2) "What block occurred at or before a given date and time?"

In the first case, one simply supplies a block number and the date and time of that block is displayed. In the later case, one provides a date (and optionally a time) and the block number that occurred at or just prior to that date and time is displayed.

The values for `date` and `time` are specified in JSON format. The `hour`/`minute`/`second` portions of the date are optional, and if omitted, default to zero in each case. Block numbers may be specified as either integers or hexidecimal values. You may specify any number of dates or blocks per invocation.

You may name your own blocks (for example, to denote the start of an ICO perhaps) by editing '$CONFIG/trueBlocks.toml' and placing `name=blockNum` pairs under the `[special]` section of that file (create the file if it is not already present, create the section if needed). Special blocks are detailed below.

#### Usage

`Usage:`    chifra when [-l|-t|-s|-v|-h] &lt; block | date &gt; [ block... | date... ]  
`Purpose:`  Finds block based on date, blockNum, timestamp, or 'special'.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | block_list | one or more dates, block numbers, hashes, or special named blocks (see notes) |
| -l | --list | export a list of the 'special' blocks |
| -t | --timestamps | ignore other options and generate timestamps only |
| -s | --skip <num> | only applicable if --timestamps is on, the step between block numbers in the export |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- The block list may contain any combination of `number`, `hash`, `date`, special `named` blocks.
- Dates must be formatted in JSON format: YYYY-MM-DD[THH[:MM[:SS]]].
- You may customize the list of named blocks by editing $CONFIG/whenBlock.toml.
- The following `named` blocks are currently configured:
  - first (`0`), firstTrans (`46147`), firstContract (`50111`), iceage (`200000`)
  - devcon1 (`543626`), homestead (`1150000`), daofund (`1428756`), daohack (`1718497`)
  - daofork (`1920000`), devcon2 (`2286910`), tangerine (`2463000`), spurious (`2675000`)
  - stateclear (`2717576`), eea (`3265360`), ens2 (`3327417`), parityhack1 (`4041179`)
  - byzantium (`4370000`), devcon3 (`4469339`), parityhack2 (`4501969`), kitties (`4605167`)
  - makerdao (`4620855`), devcon4 (`6610517`), uniswap (`6627917`), constantinople (`7280000`)
  - devcon5 (`8700401`), mcdai (`8928158`), istanbul (`9069000`), muirglacier (`9200000`)
  - latest (``)

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

**Source**: [`tools/whenBlock`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/whenBlock)

## Admin
## pinMan

The `pinMan` is not ready for prime time. Please return late.

## Building

After building **trueblocks** on the `develop` branch, go to the pinata test folder:

```[bash]
cd ../src/other/pinata
```

Edit **pinata.cpp** and change the two lines by entering your `pinata` api keys:

```[bash]
string_q API_KEY = "pinata_api_key: YOUR_KEY";
string_q API_SECRET_KEY = "pinata_secret_api_key: YOUR_SECRET_KEY";
```

Replace the `YOUR_KEY` and `YOUR_SECRET_KEY` values (not the whole string). Save and then:

```[bash]
make
./bin/pinata
```

## On Mac

When I run this on Mac, I get:

```[bash]
Curl response: 60: SSL peer certificate or SSH remote key was not OK
```

## On Ubuntu

Same code on Ubuntu produces:

```[bash]
Curl response: {"IpfsHash":"QmXTAALdtWWzm9x5GZV7bC9yiYS7iFFUL3B5jFVtdafuv2","PinSize":58,"Timestamp":"2020-07-21T21:43:36.709Z"}
```

## Which version of openssl?

On Mac:

```[bash]
openssl version -a
```

produces:

```[bash]
OpenSSL 1.0.2t  10 Sep 2019
built on: reproducible build, date unspecified
platform: darwin64-x86_64-cc
options:  bn(64,64) rc4(ptr,int) des(idx,cisc,16,int) idea(int) blowfish(idx)
compiler: clang -I. -I.. -I../include  -fPIC -fno-common -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -arch x86_64 -O3 -DL_ENDIAN -Wall -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
OPENSSLDIR: "/usr/local/etc/openssl"
```

On Ubuntu:

```[bash]
openssl version -a
```

produces:

```[bash]
OpenSSL 1.1.1  11 Sep 2018
built on: Wed May 27 19:15:54 2020 UTC
platform: debian-amd64
options:  bn(64,64) rc4(16x,int) des(int) blowfish(ptr)
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -Wa,--noexecstack -g -O2 -fdebug-prefix-map=/build/openssl-dyPhHZ/openssl-1.1.1=. -fstack-protector-strong -Wformat -Werror=format-security -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DKECCAK1600_ASM -DRC4_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DX25519_ASM -DPADLOCK_ASM -DPOLY1305_ASM -DNDEBUG -Wdate-time -D_FORTIFY_SOURCE=2
OPENSSLDIR: "/usr/lib/ssl"
ENGINESDIR: "/usr/lib/x86_64-linux-gnu/engines-1.1"
Seeding source: os-specific
```

#### Usage

`Usage:`    chifra pins [-c|-i|-f|-s|-v|-h]  
`Purpose:`  Report on and manage the remotely pinned appearance index and associated bloom filters.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
| -c | --compare | report differences (if any) between the manifest and pinning service |
| -i | --init | initialize the local index by downloading bloom filters from the pinning service |
| -f | --freshen | freshen the manifest from the hash found at the smart contract |
| -s | --sleep <double> | the number of seconds to sleep between requests during init (default .25) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

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

**Source**: [`apps/pinMan`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/pinMan)

## chifra scrape

The `chifra scrape` app queries the rpcProvider you specify (or your local node if none) using the RPC interface reading each block from any EVM-based blockchain. After extensive optimizations to the data, including <img width=500px align="right" src="docs/image.png"> determining each transaction's error status and expanding internal message calls, the blocks are stored in a speed-optimized database for fast retrieval. By doing as much work as possible prior to storage, TrueBlocks is able to achieve significant increases in speed of retrieval over the node.

Using operating system tools such as Linux's `cron` you can easily maintain a  constantly fresh TrueBlocks database. Using TrueBlocks `display strings` technology, it is even easy to populate a regular web 2.0 database and from there a full featured website representing the full state of your smart contract.

#### Usage

`Usage:`    chifra scrape [-t|-n|-p|-s|-i|-R|-v|-h] mode  
`Purpose:`  Decentralized blockchain scraper and block cache.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | mode | control the block and account scrapers, one of [run&#124;quit&#124;pause&#124;restart] (required) |
| -t | --tool <val> | process the index, monitors, or both (none means process timestamps only), one or more of [monitors&#124;index*&#124;none&#124;both] |
| -n | --n_blocks <num> | maximum number of blocks to process (defaults to 5000) |
| -p | --pin | pin new chunks (and blooms) to IPFS (requires Pinata key and running IPFS node) |
| -s | --sleep <double> | the number of seconds to sleep between passes (default 14) |
| -i | --cache_txs | write transactions to the cache (see notes) |
| -R | --cache_traces | write traces to the cache (see notes) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

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

**Source**: [`apps/blockScrape`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/blockScrape)

## pinMan

The `pinMan` is not ready for prime time. Please return late.

## Building

After building **trueblocks** on the `develop` branch, go to the pinata test folder:

```[bash]
cd ../src/other/pinata
```

Edit **pinata.cpp** and change the two lines by entering your `pinata` api keys:

```[bash]
string_q API_KEY = "pinata_api_key: YOUR_KEY";
string_q API_SECRET_KEY = "pinata_secret_api_key: YOUR_SECRET_KEY";
```

Replace the `YOUR_KEY` and `YOUR_SECRET_KEY` values (not the whole string). Save and then:

```[bash]
make
./bin/pinata
```

## On Mac

When I run this on Mac, I get:

```[bash]
Curl response: 60: SSL peer certificate or SSH remote key was not OK
```

## On Ubuntu

Same code on Ubuntu produces:

```[bash]
Curl response: {"IpfsHash":"QmXTAALdtWWzm9x5GZV7bC9yiYS7iFFUL3B5jFVtdafuv2","PinSize":58,"Timestamp":"2020-07-21T21:43:36.709Z"}
```

## Which version of openssl?

On Mac:

```[bash]
openssl version -a
```

produces:

```[bash]
OpenSSL 1.0.2t  10 Sep 2019
built on: reproducible build, date unspecified
platform: darwin64-x86_64-cc
options:  bn(64,64) rc4(ptr,int) des(idx,cisc,16,int) idea(int) blowfish(idx)
compiler: clang -I. -I.. -I../include  -fPIC -fno-common -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -arch x86_64 -O3 -DL_ENDIAN -Wall -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
OPENSSLDIR: "/usr/local/etc/openssl"
```

On Ubuntu:

```[bash]
openssl version -a
```

produces:

```[bash]
OpenSSL 1.1.1  11 Sep 2018
built on: Wed May 27 19:15:54 2020 UTC
platform: debian-amd64
options:  bn(64,64) rc4(16x,int) des(int) blowfish(ptr)
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -Wa,--noexecstack -g -O2 -fdebug-prefix-map=/build/openssl-dyPhHZ/openssl-1.1.1=. -fstack-protector-strong -Wformat -Werror=format-security -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DKECCAK1600_ASM -DRC4_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DX25519_ASM -DPADLOCK_ASM -DPOLY1305_ASM -DNDEBUG -Wdate-time -D_FORTIFY_SOURCE=2
OPENSSLDIR: "/usr/lib/ssl"
ENGINESDIR: "/usr/lib/x86_64-linux-gnu/engines-1.1"
Seeding source: os-specific
```

#### Usage

`Usage:`    chifra pins [-c|-i|-f|-s|-v|-h]  
`Purpose:`  Report on and manage the remotely pinned appearance index and associated bloom filters.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
| -c | --compare | report differences (if any) between the manifest and pinning service |
| -i | --init | initialize the local index by downloading bloom filters from the pinning service |
| -f | --freshen | freshen the manifest from the hash found at the smart contract |
| -s | --sleep <double> | the number of seconds to sleep between requests during init (default .25) |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

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

**Source**: [`apps/pinMan`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/pinMan)

## chifra status

The `chifra status` program allows one to  manage and explore [monitor cache files](../../monitors/README.md). You may list cache entries, check for duplicate or invalid cache entries (and optionally remove them). Use the tool with caution and please make sure to backup your data before proceeding.

#### Usage

`Usage:`    chifra status [-d|-t|-v|-h] &lt;mode&gt; [mode...]  
`Purpose:`  Report on status of one or more TrueBlocks caches.

`Where:`  

| Short Cut | Option | Description |
| -------: | :------- | :------- |
|  | modes | the type of status info to retrieve, one or more of [index&#124;monitors&#124;entities&#124;names&#124;abis&#124;caches&#124;some*&#124;all] |
| -d | --details | include details about items found in monitors, slurps, abis, or price caches |
| -t | --types <val> | for cache mode only, which type(s) of cache to report, one or more of [blocks&#124;transactions&#124;traces&#124;slurps&#124;prices&#124;all*] |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

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

**Source**: [`apps/cacheStatus`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/apps/cacheStatus)

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

**Source**: [`tools/ethQuote`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/ethQuote)

## chifra where

`chifra where` reports on the location of a block (or blocks) in the cache. It reports on one of three situations: `cache`, `node` or `none` depending on where the block is found.

If `chifra where` finds the block in the TrueBlocks cache, it reports the path to that block's file. If the block is not in the cache, but there is a locally running node, `chifra where` returns `node` plus the name and version info from the running node. Otherwise, `chifra where` returns `none`.

This tool is intended mostly as an aid in developing and debugging TrueBlocks tools.

#### Usage

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

**Source**: [`tools/whereBlock`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/whereBlock)


