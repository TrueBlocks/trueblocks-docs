---
title: "Blockchain Data"
description: "TrueBlocks is build on blockchain data. This reference guides you."
lead: "It all starts with transactions and addresses"
date: 2021-07-06T10:43:22-03:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu: 
  data:
    parent: collections
weight: 2050
toc: true
---
_These fields describe the output of various TrueBlocks blockchain queries.
For information about how to refine these queries, see
[the corresponding CLI section](/docs/chifra/chaindata/)_

## Transactions

Transactions represent eth transfers to and from other addresses.

Most of the fields that TrueBlocks returns are standard to all eth transaction.
However, one field is very interesting: `articulatedTx` provides a human readable output of the `input` field.

This is a very powerful way to understand the story behind a smart contract.

### How to get transactions

* **CLI**: 
  * run `chifra transactions <txn_id>`.
  * Use the `--articulate` option to turn the `input` field human readable.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-transactions)
* **API**: 
  * [Calls to `/transactions`](https://www.tokenomics.io/api.html#/ChainData/chaindata-transactions)
* **Explorer**

### Reference of transaction fields

|Field|Description|Type|
|:----|:-----------|---|
|hash|The transaction's hash|String|
|blockHash|The hash of the block where the transaction appears|String|
|blockNumber|The block where the transaction appears|number|
|transactionIndex|The transaction's index position on the block|number|
|nonce|Number of transactions sent by user|number|
|timestamp|unix timestamp|number|
|from|originating address|string|
|to|recipient address|string|
|value|Amount of Eth sent. If `0`, likely a smart contract. Try the `--articulate` option|number
|gas|The fee for a particular action|number|
|gasPrice|The amount a user is willing to spend on a unit of gas (in Gwei)|number|
|input|Information about the smart contract. Use the `--articulate` option to make the bytes human readable|string|
|isError|`true` if transaction ended in error|boolean
|hasToken|`true` if transaction is token related|boolean
|receipt|[Receipt](#receipt) for the transaction|
|[traces](#traces)|an array of trace objects|array|
|articulatedTx|A human readable articulation of the `input` field|object|
|compressedTx|Truncated, more readable version of the transaction|string|
|statements|The reconciliation of the transaction|array 
|finalized|Whether TrueBlocks will continue querying the chain for this block|boolean|

## Blocks

`chifra blocks` returns top level data specified block. You can also include
an array for the blocks' transactions.


### How to get blocks

* **CLI**: 
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-blocks)
* **API**: 
  * [Calls to `/transactions`](https://www.tokenomics.io/api.html#/ChainData/chaindata-blocks)
* **Explorer**

### Reference of block fields

|Field|description|type|
|-----|-----------|----|
|gasLimit|The maximum price that a user is willing to spend on an operation
(if no flags, default in wei)|number|
|gasUsed|The amount of gas used|number|
|hash|the hash for that block|string
|blockNumber|The block where the transaction appears|number|
|parentHash|The hash of the previous block|string|
|miner|address of the block's miner|string|
|difficulty|the computational difficulty at this block|number|
|finalized|Whether TrueBlocks will continue querying the chain for this block|boolean|
|timestamp|unix timestamp|number|
|transactionscnt|number of transactions|number|
|transactions|Array of [transactions](#transactions)|object|

## Receipts

Receipts record the gas used.
If the transaction succeeded, a receipt might also have logs.

If a transaction is sent to the '0x0' address (i.e. to is 0x0),
then that the input data is the source code (byte code) for a smart contract.
In that case, the `contractAddress` of the receipt carries the address of the
newly created smart contract.

### How to get receipts

* **CLI**: 
  * run `chifra receipts <txn_id>`.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-receipts)
* **API**: 
  * [Calls to `/receipts`](https://www.tokenomics.io/api.html#/ChainData/chaindata-receipts)
* **Explorer**

### Reference of receipt fields


|Field|description|
|-----|-----------|
|contractAddress|address of the newly created contract (if `to` address is `0x0`)|string|
|gasUsed|amount of gas used in transaction|number|
|logs|see [logs](#logs)|object|
|status|Whether the transaction was successful.`1` indicates success, `0` failure ([_source_](https://eips.ethereum.org/EIPS/eip-658#specification).|

## Logs

Logs are only ever created by smart contracts.

### How to get logs

* **CLI**: 
  * run `chifra logs <txn_id>`.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-logs)
* **API**: 
  * [Calls to `/logs`](https://www.tokenomics.io/api.html#/ChainData/chaindata-logs)
* **Explorer**

### Reference of log fields

|Field|description|type|
|-----|-----------|----|
|address|the smart contract that emitted this log|string|
|logIndex|the log's position relative to the block|number|
|topics|hash of the signature of an event and the its indexed parameters (Max items: 4)|array|
|data|The unindexed parameters of the event|string|
|blocknumber|Block where this log was|number|
|transactionindex|Integer of the transaction's index position in the block|number|
|address|originating address|string|
|articulatedLog|A human-readable version of the `topic` and `data` fields|object|
|compressedLog|Truncated, more readable version of the log|string|

<!---emitter is used in chifra export --->

## Traces

Every transaction has a `to` address. If that `to` address is a smart contract,
there might be traces.

Traces represent the tree of function calls made by the `to` address to
other smart contracts (or to itself) as the transaction executes.


### How to get traces

* **CLI**: 
  * run `chifra traces <txn_id>`.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-traces)
* **API**: 
  * [Calls to `/traces`](https://www.tokenomics.io/api.html#/ChainData/chaindata-traces)
* **Explorer**

### Reference of trace fields

|Field|description|type|
|-----|-----------|---|
|blockHash|Hash of the block where this transaction was|string|
|blockNumber|Number of the block where this transaction was|number|
|transactionHash|hash of the transaction|string|
|transactionindex|Index of the transaction in the block|number|
|traceAddress|a particular trace's address in the trace tree|string|
|subtraces|The number of child traces that the transaction has (i.e. the number of calls into other objects)|number|
|type|the type of the trace|string|
|action|[The trace action object](#trace-action)|object|
|result|[The trace result object](#trace-result)|object|

#### Trace action

Because they are calls to smart contracts, trace actions closely resemble the
[fields of transactions](#transactions).

|Field|description|type|
|-----|-----------|---|
|from|the smart contract address that called the trace|string|
|to|the smart contract address that the trace calls|string|
|gas|The maximum amount of gas allowed for this call|number|
|input|An encoded version of the function call. Use the `--articulate` option for human readable representation|string|
|callType|the type of call|string|
|refundAddress|if the call type is `self-destruct`, the address where the refund goes|string|
|articulatedTrace|A human-readable version of the trace action's `input` and the result's `output`|object|
|compressedTrace|Truncated, more readable version of the trace|string|

#### Trace result

Because they are the results of the call to a smart contract,
trace results fields closely resemble the [fields of receipts](#receipts).

|Field|description|type|
|-----|-----------|---|
|newContract|address of the newly created contract (if `to` address is `0x0`)|string|
|code|We don't know :-)|?|
|gasUsed|amount of gas used in the trace|number|
|output|the result of the call for this trace|string|


## when block

* **CLI**: 
  * run `chifra when <block_id>`.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-when)
* **API**: 
  * [Calls to `/when`](https://www.tokenomics.io/api.html#/ChainData/chaindata-when)
* **Explorer**

When a block appeared, in unix and human readable format:
|Field|description|type|
|-----|-----------|----|
|blockNumber|number of block|number|
|timestamp|Unix time|number|
|date|Human readable date|string|	

