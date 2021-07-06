---
title: "Blockchain Data"
description: ""
lead: ""
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

All TrueBlocks data is built on top of Ethereum data.
It all starts with transactions and addressess...

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

|Field|Description|
|:----|:-----------|
|hash|The transaction's hash|
|blockHash|The hash of the block the transaction belongs to||
|blockNumber|The number of the block the transaction belongs to||
|transactionIndex||
|nonce|Number of transactions sent by user|
|timestamp||
|from|originating address|
|to|recipient address|
|value|Amount of Eth sent. If `0`, likely a smart contract. Try the `--articulate` option|
|extraValue1||
|extraValue2||
|gas||
|gasPrice||
|input|Information about the smart contract. Use the `--articulate` option to make the bytes human readable|
|isError||
|hasToken||
|cachebits=CB_NONE||
|reserved2||
|receipt|[Receipt](#receipt) if transaction succeeds|
|[traces](#traces)||
|articulatedTx|A human readable articulation of the hash in the `input` field|
|compressedTx (nowrite)||
|statements (nowrite)||
|finalized (nowrite)||


## Blocks


## Receipts

## Logs

## Traces
