---
title: "Blockchain Data"
description: "Trublocks is build on blockchain data. This reference guides you."
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
_These fields describe the output of various Trueblocks blockchain queries.
For information about how to refine these queries, see
[the corresponding CLI section](/docs/chifra/chaindata/)_

## Transactions

Transactions represent eth transfers to and from other addresses.

Most of the fields that Trueblocks returns are standard to all eth transaction.
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
|timestamp|unix timestamp|number
|from|originating address|string
|to|recipient address|string
|value|Amount of Eth sent. If `0`, likely a smart contract. Try the `--articulate` option|number
|gas|The fee for a particular action|number|
|gasPrice|The amount a user is willing to spend on a unit of gas (in Gwei)|number|
|input|Information about the smart contract. Use the `--articulate` option to make the bytes human readable|string|
|isError||boolean
|hasToken||boolean
|cachebits=CB_NONE||
|reserved2||
|receipt|[Receipt](#receipt) if transaction succeeds|
|[traces](#traces)||
|articulatedTx|A human readable articulation of the hash in the `input` field|object
|compressedTx (nowrite)||string
|statements (nowrite)||
|finalized (nowrite)||

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
|gasLimit|The maximum price that a user is willing to spend on an operation (in Eth|number|
|gasUsed|The amount of gas used|number|
|hash|the hash for that block|string
|blockNumber|The block where the transaction appears|number|
|parentHash||string|
|miner|address of blocks miner|string|
|difficulty||number|
|price||
|finalized||boolean|
|timestamp|unix timestamp|number|
|transactionscnt|number of transactions|number|
|transactions|Array of [transactions](#transactions)|object|

## Receipts

If a transaction is sent to the '0x0' address (i.e. to is 0x0),
then that the input data is the source code (byte code) for a smart contract.
In that case, the `contractAddress` of the receipt carries the address of the newly created smart contract.

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
|contractAddress|address of the contract|string|
|gasUsed|amount of gas used in transaction|number|
|logs|see [logs](#logs)|object|
|status|Whether the transaction was successful.`1` indicates success, `0` failure ([_source_](https://eips.ethereum.org/EIPS/eip-658#specification).|

## Logs

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
|address||string|
|logIndex|position on log|number|
|topics|||
|data|||
|types|||
|blocknumber|Block where this log was|number|
|transactionindex|| Integer of the transaction's index position in the block.|number|
|logindex| Integer of the event index position in the block.|number|
|address|origniating address|string|
|topic|||
|data|||
|type|||
|compressedlog|

## Traces
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
|blockHash|Hash of the block where this transaction was|string
|blockNumber|Number of the block where this transaction was|number|
|subtraces||
|traceAddress||
|transactionHash|hash of the transaction||
|transactionindex|Integer of the transaction's index position in the block.|number|
|type|||
|action|The object action|
|result||


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
|timestamp|unix time|number|
|date|Human readable date|string|	
