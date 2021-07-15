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
    parent: intro
weight: 1200
toc: true
---

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

### How to get blocks

* **CLI**: 
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-blocks)
* **API**: 
  * [Calls to `/transactions`](https://www.tokenomics.io/api.html#/ChainData/chaindata-blocks)
* **Explorer**

### Reference of block fields

|Field|description|type|
|-----|-----------|----|
|gasLimit||
|gasUsed||
|hash||
|blockNumber||
|parentHash||
|miner||
|difficulty||
|price||
|finalized||
|timestamp|unix timestamp|number
|transactions||
|tx_hashes (nowrite)||
|name (nowrite)||
|light (nowrite)||


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
|contractAddress||
|gasUsed||
|logs|see [logs](#logs)|
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

|Field|description|
|-----|-----------|
|address|
|logIndex|
|topics|
|data|
|types|

## Traces
### How to get traces

* **CLI**: 
  * run `chifra traces <txn_id>`.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-traces)
* **API**: 
  * [Calls to `/traces`](https://www.tokenomics.io/api.html#/ChainData/chaindata-traces)
* **Explorer**

### Reference of transaction fields

|Field|description|
|-----|-----------|
|blockHash||
|blockNumber||
|subtraces||
|traceAddress||
|transactionHash||
|transactionIndex||
|type||
|action|The object action|
|result||
