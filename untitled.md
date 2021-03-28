# Tools

## getTrace <a id="_gettrace"></a>

`getTrace` returns a transaction’s traces. You may specify the logs you want using either a transaction hash \(trans\\_hash\), a block hash plus transaction index \(block\\_hash.trans\\_id\), or a block number plus transaction index \(block\\_num.trans\\_id\).

### Usage <a id="_usage"></a>

`Usage:` getTrace \[-a\|-c\|-v\|-h\] &lt;tx\_id&gt; \[tx\_id…​\] `Purpose:` Retrieve a transaction’s traces from the cache or the node.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| transactions \| a space-separated list of one or more transaction identifiers \(tx\_hash, bn.txID, blk\_hash.txID\) \(required\) \| \| -a \| --articulate \| articulate the transactions if an ABI is found for the 'to' address \| \| -c \| --count \| show the number of traces for the transaction only \(fast\) \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `transactions` is one or more space-separated identifiers which may be either a transaction hash, a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
* This tool checks for valid input syntax, but does not check that the transaction requested exists.
* If the queried node does not store historical state, the results are undefined.

### Other Options <a id="_other_options"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## ethQuote <a id="_ethquote"></a>

The `ethQuote` tool provides Ethereum price data to various tools or for other purposes. Currently, `ethQuote` retrieves data using the Poloniex API. In future versions, we intend to add other sources of pricing data and provide a mechanism to specify an averaging calculate given multiple price sources. Ultimately, we hope Ethereum/fiat price data appears under consensus, but until that time, **TrueBlocks** uses `ethQuote`. Powered, in part, by Poloniex&lt;sup&gt;®&lt;sup&gt; \#\# Usage

`Usage:` ethQuote \[-f\|-p\|-a\|-e\|-v\|-h\] `Purpose:` Freshen and/or display Ethereum price data.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| -f \| --freshen \| Freshen price database \(append new data\) \| \| -p \| --period &lt;val&gt; \| increment of display, one of \[5\|15\|30\|60\|120\*\|240\|1440\|10080\|hourly\|daily\|weekly\] \| \| -a \| --pair &lt;str&gt; \| which price pair to freshen or list \(see Poloniex\) \| \| -e \| --feed &lt;val&gt; \| the feed for the price data, one of \[poloniex\*\|maker\|tellor\] \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* Valid pairs include any pair from the public Poloniex’s API here: [https://poloniex.com/public?command=returnCurrencies](https://poloniex.com/public?command=returnCurrencies).
* `Note`: Due to restrictions from Poloniex, this tool retrieves only 30 days of data at a time. You must repeatedly run this command until the data is up-to-date.

### Other Options <a id="_other_options_2"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## getTrans <a id="_gettrans"></a>

The `getTrans` tool retrieves transactions from the running Ethereum node \(using the `--raw` option\) or from TrueBlocks \(the default\). You may provide a transaction `hash`, a `blockNumber.transactionID` pair, or a `blockHash.transactionID` pair \(or any combination\) to specify the transaction\(s\).

### Usage <a id="_usage_2"></a>

`Usage:` getTrans \[-a\|-t\|-u\|-v\|-h\] &lt;tx\_id&gt; \[tx\_id…​\] `Purpose:` Retrieve a transaction from the cache or the node.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| transactions \| a space-separated list of one or more transaction identifiers \(tx\_hash, bn.txID, blk\_hash.txID\) \(required\) \| \| -a \| --articulate \| articulate the transactions if an ABI is found for the 'to' address \| \| -t \| --trace \| display the transaction’s trace \| \| -u \| --uniq \| display a list of uniq addresses found in this transaction \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `transactions` is one or more space-separated identifiers which may be either a transaction hash, a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
* This tool checks for valid input syntax, but does not check that the transaction requested exists.
* If the queried node does not store historical state, the results are undefined.

### Other Options <a id="_other_options_3"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## getReceipt <a id="_getreceipt"></a>

`getReceipt` returns a transaction’s receipt. You may specify the logs you want using either a transaction hash \(trans\\_hash\), a block hash plus transaction index \(block\\_hash.trans\\_id\), or a block number plus transaction index \(block\\_num.trans\\_id\).

### Usage <a id="_usage_3"></a>

`Usage:` getReceipt \[-a\|-l\|-v\|-h\] &lt;tx\_id&gt; \[tx\_id…​\] `Purpose:` Retrieve a transaction’s receipt from the cache or the node.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| transactions \| a space-separated list of one or more transaction identifiers \(tx\_hash, bn.txID, blk\_hash.txID\) \(required\) \| \| -a \| --articulate \| articulate the transactions if an ABI is found for the 'to' address \| \| -l \| --logs \| display the receipt’s logs \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `transactions` is one or more space-separated identifiers which may be either a transaction hash, a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
* This tool checks for valid input syntax, but does not check that the transaction requested exists.
* If the queried node does not store historical state, the results may be undefined.

### Other Options <a id="_other_options_4"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## getBlock <a id="_getblock"></a>

The `getBlock` tool retrieves Ethereum block data from a running node or, if previously retrieved, the QBlocks cache. It optionally retrieves the hashes that denote the transactions in the block or the full transactional data as a default.

The tool may also be used to double check that the results produced from the QBlocks cache and the results as retrieved directly from the running node are identical \(modulo the fact that QBlocks does not store every data field from the node\). You may accomplish this `check` with the --check option.

### Usage <a id="_usage_4"></a>

`Usage:` getBlock \[-r\|-n\|-c\|-l\|-a\|-u\|-x\|-m\|-l\|-v\|-h\] &lt;block&gt; \[block…​\] `Purpose:` Returns block\(s\) from local cache or directly from a running node. `Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| block\_list \| a space-separated list of one or more blocks to retrieve \| \| -r \| --raw \| pull the block data from the running Ethereum node \(no cache\) \| \| -n \| --hash\_only \| display only transaction hashes, default is to display full transaction detail \| \| -c \| --check \| compare results between qblocks and Ethereum node, report differences, if any \| \| -l \| --latest \| display the latest blocks at both the node and the cache \| \| -a \| --addrs \| display all addresses included in the block \| \| -u \| --uniq \| display only uniq addresses found per block \| \| -x \| --uniqTx \| display only uniq addresses found per transaction \| \| -m \| --number \| display address counts \(alterntively --addrCnt, --uniqTxCnt, or --uniqCnt\) \| \| -l \| --filter val \| useful only for --addrs or --uniq, only display this address in results \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `block_list` is a space-separated list of values, a start-end range, a `special`, or any combination.
* This tool retrieves information from the local node or the ${FALLBACK} node, if configured \(see documentation\).
* `special` blocks are detailed under `whenBlock --list`.

### Other Options <a id="_other_options_5"></a>

All **QBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
Command     |     Description
-----------------------------------------------------------------------------
--version   |   display the current version of the tool
--nocolor   |   turn off colored display
--wei       |   specify value in wei (the default)
--ether     |   specify value in ether
--dollars   |   specify value in US dollars
--file:fn   |   specify multiple sets of command line options in a file.
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by Qblocks&lt;sup&gt;™&lt;/sup&gt;**

## getTokenInfo <a id="_gettokeninfo"></a>

Given the address of an ERC20 token contract, report token balances for one or more accounts. Alternatively, report token balances for multiple ERC20 contracts for a single account.

In normal operation the **first item** in the `address_list` is considered to be an ERC20 token contract whose balances are queried, whereas the remainder of the list is assumed to be accounts on which to report.

In `--byAcct` mode, **all items** in the `address_list` are assumed to be token contracts, except the last which is the account whose token balances are reported.

You may optionally specify one or more blocks at which to report.

### Usage <a id="_usage_5"></a>

`Usage:` getTokenInfo \[-p\|-b\|-n\|-v\|-h\] &lt;address&gt; &lt;address&gt; \[address…​\] \[block…​\] `Purpose:` Retrieve token balances for one or more address at given block\(s\).

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| addrs \| two or more addresses \(0x…​\), the first is an ERC20 token, balances for the rest are reported \(required\) \| \| \| blocks \| an optional list of one or more blocks at which to report balances, defaults to 'latest' \| \| -p \| --parts &lt;val&gt; \| one or more parts of the token information to retreive, one or more of \[name\|symbol\|decimals\|totalSupply\|version\|none\|all\*\] \| \| -b \| --by\_acct \| consider each address an ERC20 token except the last, whose balance is reported for each token \| \| -n \| --no\_zero \| suppress the display of zero balance accounts \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `addresses` must start with '0x' and be forty two characters long.
* `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
* If the token contract\(s\) from which you request balances are not ERC20 compliant, the results are undefined.
* If the queried node does not store historical state, the results are undefined.
* `special` blocks are detailed under `whenBlock --list`.

### Other Options <a id="_other_options_6"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## whenBlock <a id="_whenblock"></a>

The `whenBlock` tool answers one of two questions: \(1\) "At what date and time did a given block occur?" or \(2\) "What block occurred at or before a given date and time?"

In the first case, one simply supplies a block number and the date and time of that block is displayed. In the later case, one provides a date \(and optionally a time\) and the block number that occurred at or just prior to that date and time is displayed.

The values for `date` and `time` are specified in JSON format. The `hour`/`minute`/`second` portions of the date are optional, and if omitted, default to zero in each case. Block numbers may be specified as either integers or hexidecimal values. You may specify any number of dates or blocks per invocation.

You may name your own blocks \(for example, to denote the start of an ICO perhaps\) by editing '~/.quickBlocks/quickBlocks.toml' and placing `name=blockNum` pairs under the `[special]` section of that file \(create the file if it is not already present\). Special blocks are detailed below.

### Usage <a id="_usage_6"></a>

`Usage:` whenBlock \[-l\|-t\|-s\|-v\|-h\] &lt; block \| date &gt; \[ block…​ \| date…​ \] `Purpose:` Finds block based on date, blockNum, timestamp, or 'special'.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| block\_list \| one or more dates, block numbers, hashes, or special named blocks \(see notes\) \| \| -l \| --list \| export a list of the 'special' blocks \| \| -t \| --timestamps \| ignore other options and generate timestamps only \| \| -s \| --skip &lt;num&gt; \| only applicable if --timestamps is on, the step between block numbers in the export \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* The block list may contain any combination of `number`, `hash`, `date`, special `named` blocks.
* Dates must be formatted in JSON format: YYYY-MM-DD\[THH\[:MM\[:SS\]\]\].
* You may customize the list of named blocks by editing ~/.quickBlocks/whenBlock.toml.
* The following `named` blocks are currently configured:
* first \(`0`\), firstTrans \(`46147`\), firstContract \(`50111`\), iceage \(`200000`\)
* devcon1 \(`543626`\), homestead \(`1150000`\), daofund \(`1428756`\), daohack \(`1718497`\)
* daofork \(`1920000`\), devcon2 \(`2286910`\), tangerine \(`2463000`\), spurious \(`2675000`\)
* stateclear \(`2717576`\), eea \(`3265360`\), ens2 \(`3327417`\), parityhack1 \(`4041179`\)
* byzantium \(`4370000`\), devcon3 \(`4469339`\), parityhack2 \(`4501969`\), kitties \(`4605167`\)
* makerdao \(`4620855`\), devcon4 \(`6610517`\), uniswap \(`6627917`\), constantinople \(`7280000`\)
* devcon5 \(`8700401`\), mcdai \(`8928158`\), istanbul \(`9069000`\), muirglacier \(`9200000`\)
* latest \(\`\`\)

### Other Options <a id="_other_options_7"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## ethslurp <a id="_ethslurp"></a>

`ethslurp` is one of our older command line tools. It even has its \[own website\]\([http://ethslurp.com](http://ethslurp.com/)\) and \[video tutorial\] \([https://www.youtube.com/w](https://www.youtube.com/w) atch?v=ZZDV1yAgces\). While this tool is very useful, it has two significant flaws. First, it is not decentralized—​in fact it is fully centralized, pulling its data from \[[http://etherscan.io](http://etherscan.io/)\]\([http://etherscan.io](http://etherscan.io/)\) as it does. The tool’s second major flaw is that it does not pull every transaction from the chain for a given account as our \[account monitors\]\(../../monitors/README.md\) do. This is because of `internal transactions` which, believe us, is too complicated to be worth taking the time to explain.

While `ethslurp` does have its shortcomings, it also provides some nice features. You can use it to pull all externally generated transactions against an account. You may also use the tool’s fully customizable formatting options to export data into any format you wish. Visit the above referenced website for more information.

### Usage <a id="_usage_7"></a>

`Usage:` ethslurp \[-t\|-p\|-v\|-h\] &lt;address&gt; \[address…​\] \[block…​\] `Purpose:` Fetches data from EtherScan for an arbitrary address.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| addrs \| one or more addresses to slurp from Etherscan \(required\) \| \| \| blocks \| an optional range of blocks to slurp \| \| -t \| --types &lt;val&gt; \| one or more types of transactions to request, one or more of \[ext\*\|int\|token\|nfts\|miner\|all\] \| \| -p \| --appearances \| show only the blocknumer.tx\_id appearances of the exported transactions \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* Portions of this software are Powered by Etherscan.io APIs.

### Other Options <a id="_other_options_8"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## getState <a id="_getstate"></a>

Retrieve the balance \(in wei\) of an address \(or list of addresses\) at a given block\(s\). You may specify multiple addresses and/or multiple blocks, but you must specify at least one address.

This simple program may be used to query an Ethereum address to determine if it is a `smart contract` or simply a regular `external account`. It may also be used to retrieve the byte-code from an address \(if present\). Finally, it may be used to compare the byte code found at two addresses to determine if they hold identical code. You may specify multiple addresses on a line.

### Usage <a id="_usage_8"></a>

`Usage:` getState \[-p\|-c\|-n\|-v\|-h\] &lt;address&gt; \[address…​\] \[block…​\] `Purpose:` Retrieve the balance of one or more address at the given block\(s\).

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| addrs \| one or more addresses \(0x…​\) from which to retrieve balances \(required\) \| \| \| blocks \| an optional list of one or more blocks at which to report balances, defaults to 'latest' \| \| -p \| --parts &lt;val&gt; \| control which state to export, one or more of \[none\|some\*\|all\|balance\|nonce\|code\|storage\|deployed\|accttype\] \| \| -c \| --changes \| only report a balance when it changes from one block to the next \| \| -n \| --no\_zero \| suppress the display of zero balance accounts \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `addresses` must start with '0x' and be forty two characters long.
* `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
* If the queried node does not store historical state, the results are undefined.
* `special` blocks are detailed under `whenBlock --list`.
* `balance` is the default mode. To select a single mode use `none` first, followed by that mode.
* You may specify multiple `modes` on a single line.

### Usage <a id="_usage_9"></a>

`Usage:` getState \[-p\|-c\|-n\|-v\|-h\] &lt;address&gt; \[address…​\] \[block…​\] `Purpose:` Retrieve the balance of one or more address at the given block\(s\).

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| addrs \| one or more addresses \(0x…​\) from which to retrieve balances \(required\) \| \| \| blocks \| an optional list of one or more blocks at which to report balances, defaults to 'latest' \| \| -p \| --parts &lt;val&gt; \| control which state to export, one or more of \[none\|some\*\|all\|balance\|nonce\|code\|storage\|deployed\|accttype\] \| \| -c \| --changes \| only report a balance when it changes from one block to the next \| \| -n \| --no\_zero \| suppress the display of zero balance accounts \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `addresses` must start with '0x' and be forty two characters long.
* `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
* If the queried node does not store historical state, the results are undefined.
* `special` blocks are detailed under `whenBlock --list`.
* `balance` is the default mode. To select a single mode use `none` first, followed by that mode.
* You may specify multiple `modes` on a single line.

### Other Options <a id="_other_options_9"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## turboDive <a id="_turbodive"></a>

`turboDive` is a simple tool that dives into the details of the TurboGeth database. It is not really ready for prime time, so use with caution

### Usage <a id="_usage_10"></a>

`Usage:` turboDive \[-m\|-d\|-n\|-g\|-z\|-v\|-h\] `Purpose:` Dive deeply into the turboGeth database.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| -m \| --mode &lt;val&gt; \| the command to run, one of \[tables\*\|dump\] \| \| -d \| --datadir &lt;str&gt; \| folder containing TurboGeth data file \(data.mdb\) \| \| -n \| --name &lt;str&gt; \| for 'dump' command only, the name of the table to dump \| \| -g \| --goerli \| run against the goerli testnet \| \| -z \| --no\_zero \| suppress the display of tables with zero records \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

### Other Options <a id="_other_options_10"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## getBlock <a id="_getblock_2"></a>

The `getBlock` tool retrieves Ethereum block data from a running node or, if previously retrieved, the TrueBlocks cache. It optionally retrieves the hashes that denote the transactions in the block or the full transactional data as a default.

The tool may also be used to double check that the results produced from the TrueBlocks cache and the results as retrieved directly from the running node are identical \(modulo the fact that TrueBlocks does not store every data field from the node\). You may accomplish this `check` with the --check option.

### Usage <a id="_usage_11"></a>

`Usage:` getBlock \[-e\|-a\|-u\|-n\|-c\|-U\|-v\|-h\] &lt;block&gt; \[block…​\] `Purpose:` Returns block\(s\) from local cache or directly from a running node.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| blocks \| a space-separated list of one or more blocks to retrieve \(required\) \| \| -e \| --hashes\_only \| display only transaction hashes, default is to display full transaction detail \| \| -a \| --apps \| display all address appearances included in the block \| \| -u \| --uniq \| display only uniq addresses found per block \| \| -n \| --uniq\_tx \| display only uniq addresses found per transaction \| \| -c \| --count \| display counts of appearances \(for --apps, --uniq, or --uniq\_tx\) or transactions \| \| -U \| --uncles \| display uncle blocks \(if any\) instead of the requested block \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `blocks` is a space-separated list of values, a start-end range, a `special`, or any combination.
* `special` blocks are detailed under `whenBlock --list`.

### Other Options <a id="_other_options_11"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## ethNames <a id="_ethnames"></a>

`ethNames` lists the addresses found in your local node’s keystore. It can be used to report your ether holdings, for example. It also lists known, named accounts from \[ethName\]\(../ethName/README.md\).

One way to use this tool is to feed its output through the \[getState\]\(../getState/README.md\) or \[getTokenInfo\]\(../getTokenInfo/README.md\). This will give you the balances of your ether holdings or token holings. For example, you can do these commands:

List accounts held in the local node’s keystore:

List balances of those accounts \(note 'xargs' puts the results on a single line\):

```text
    getState --mode balance `ethNames -a | xargs`
    
List balances of the local node's accounts in US dollars:
```

```text
getState --mode balance `ethNames -a | xargs` --dollars
```

Using ethName to find Singular’s address, list token balances held by your accounts:

```text
getTokenInfo `ethName -a singular` `ethNames | xargs`
```

Using ethName to find Singular’s address, list tokens held by other token accounts:

```text
getTokenInfo `ethName -a singular` `ethNames -n | xargs`
```

### Usage <a id="_usage_12"></a>

`Usage:` ethNames \[-e\|-m\|-l\|-o\|-c\|-p\|-n\|-a\|-s\|-g\|-v\|-h\] &lt;term&gt; \[term…​\] `Purpose:` Query addresses and/or names of well known accounts.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| terms \| a space separated list of one or more search terms \(required\) \| \| -e \| --expand \| expand search to include all fields \(default searches name, address, and symbol only\) \| \| -m \| --match\_case \| do case-sensitive search \| \| -l \| --all \| include all accounts in the search \| \| -o \| --owned \| include personal accounts in the search \| \| -c \| --custom \| include your custom named accounts \| \| -p \| --prefund \| include prefund accounts \| \| -n \| --named \| include well know token and airdrop addresses in the search \| \| -a \| --addr \| display only addresses in the results \(useful for scripting\) \| \| -s \| --entities \| display entity data \| \| -g \| --tags \| export the list of tags and subtags only \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* With a single search term, the tool searches both `name` and `address`.
* With two search terms, the first term must match the `address` field, and the second term must match the `name` field.
* When there are two search terms, both must match.
* The `--match_case` option requires case sensitive matching. It works with all other options.
* To customize the list of names add a `custom` section to the config file \(see documentation\).
* Name file: `~/.quickBlocks/names/names.tab` \(1153506\)

### Other Options <a id="_other_options_12"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## grabABI <a id="_grababi"></a>

`grabABI` retrieves an ABI file either from a local cache, from the Ethereum Name Service \(ENS\), or from \[Etherscan\]\([http://etherscan.io](http://etherscan.io/)\). Once retrieved, `grabABI` generates the classDefinition files needed by \[makeClass\]\(../makeClass/README.md\) to generate a parselib for each \[Ethereum address monitor\]\(../../monitors/README.md\).

### Usage <a id="_usage_13"></a>

`Usage:` grabABI \[-c\|-k\|-f\|-v\|-h\] &lt;address&gt; \[address…​\] `Purpose:` Fetches the ABI for a smart contract.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| addrs \| list of one or more smart contracts whose ABI to grab from EtherScan \(required\) \| \| -c \| --canonical \| convert all types to their canonical represenation and remove all spaces from display \| \| -k \| --known \| load common 'known' ABIs from cache \| \| -f \| --find &lt;str&gt; \| try to search for a function declaration given a four byte code \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* Solidity files found in the local folder with the name '&lt;address&gt;.sol' are converted to an ABI prior to processing \(and then removed\).

### Other Options <a id="_other_options_13"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## whereBlock <a id="_whereblock"></a>

`whereBlock` reports on the location of a block \(or blocks\) in the cache. It reports on one of four situations: `cache`, `node` or `none` depending on where the block is found.

If `whereBlock` finds the block in the TrueBlocks cache, it reports the path to that block’s file. If the block is not in the cache, but there is a locally running node, `whereBlock` returns `node` plus the name and version info from the running node. Otherwise, `whereBlock` returns `none`.

This tool is intended mostly as an aid in developing and debugging TrueBlocks tools.

### Usage <a id="_usage_14"></a>

`Usage:` whereBlock \[-v\|-h\] &lt;block&gt; \[block…​\] `Purpose:` Reports in which cache \(if any\) a block is found.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| blocks \| a space-separated list of one or more blocks to search for \(required\) \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* Customize the location of the cache in the configuration file ~/.quickBlocks/quickBlocks.toml.

### Other Options <a id="_other_options_14"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

## getLogs <a id="_getlogs"></a>

`getLogs` returns a transaction’s logs. You may specify the logs you want using either a transaction hash \(trans\\_hash\), a block hash plus transaction index \(block\\_hash.trans\\_id\), or a block number plus transaction index \(block\\_num.trans\\_id\).

### Usage <a id="_usage_15"></a>

`Usage:` getLogs \[-a\|-v\|-h\] &lt;tx\_id&gt; \[tx\_id…​\] `Purpose:` Retrieve a transaction’s logs from the cache or the node.

`Where:`

\| Short Cut \| Option \| Description \| \| -------: \| :------- \| :------- \| \| \| transactions \| a space-separated list of one or more transaction identifiers \(tx\_hash, bn.txID, blk\_hash.txID\) \(required\) \| \| -a \| --articulate \| articulate the transactions if an ABI is found for the 'to' address \| \| -v \| --verbose \| set verbose level. Either -v, --verbose or -v:n where 'n' is level \| \| -h \| --help \| display this help screen \|

`Notes:`

* `transactions` is one or more space-separated identifiers which may be either a transaction hash, a blockNumber.transactionID pair, or a blockHash.transactionID pair, or any combination.
* This tool checks for valid input syntax, but does not check that the transaction requested exists.
* If the queried node does not store historical state, the results may be undefined.

### Other Options <a id="_other_options_15"></a>

All **TrueBlocks** command-line tools support the following commands \(although in some case, they have no meaning\):

```text
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
```

&lt;small&gt;\*For the `--file:fn` option, place a series of valid command lines in a file and use the above options. In some cases, this option may significantly improve performance. A semi-colon at the start of a line makes that line a comment.\*&lt;/small&gt;

**Powered by TrueBlocks&lt;sup&gt;™&lt;/sup&gt;**

