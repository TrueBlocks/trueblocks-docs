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
|statements|Statements is an array of [reconciliations of the transaction](#reconciliations). One for each asset.|array (of objects)
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
|gasLimit|The maximum price that a user is willing to spend on an operation (if no flags, default in wei)|number|
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

### How to get when blocks

* **CLI**:
  * run `chifra when <block_id>`.
  * [See the command's documentation](/docs/chifra/chaindata/#chifra-when)
* **API**:
  * [Calls to `/when`](https://www.tokenomics.io/api.html#/ChainData/chaindata-when)
* **Explorer**

### Reference of block fields

When a block appeared, in unix and human readable format:
|Field|description|type|
|-----|-----------|----|
|blockNumber|number of block|number|
|timestamp|Unix time|number|
|date|Human readable date|string|

## Reconciliations

Every transaction will have a reconciliation for ETH, and many will have a
second reconciliation for whatever ERC20 token is involved.

Because DeFi is essentially swaps and trades around ERC20s,
and because and 'programmable money' allows for unlimited actions to happen
under a single transaction,
Many times a transaction has four or five reconciliations

### Reference of reconciliation fields


| Name|Description|Type(see [reference of type formats](reference-of-type-formats)|
| -------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------
| blockNumber|The block number of the transaction this reconciliation is part of|blknum_t|
| transactionIndex|The transaction index of the transaction this reconciliation is part of|blknum_t|
| timestamp|The timestamp of the block|timestamp_t
| assetAddr|For reconciliations whose `assetSymbol` is `ETH` or `WEI`, this is the address for which this reconciliation holds. For all other values of `assetSymbol` this is the address of the asset itself. Called `accountedFor` below.|address_t|
| assetSymbol|Either `ETH`, `WEI` or the symbol of the asset being reconciled as extracted from the chain.|string_q|
| decimals|Equivilent to the extracted value of getSymbol from ERC20 or, if `ETH` or `WEI` then `18`|uint64_t|
| prevBlk|The block number of the previous reconciliation|blknum_t|
| prevBlkBal|The account balance for the given asset for the previous reconciliation|bigint_t|
| begBal|The beginning balance of the asset at the `blockNumber`|bigint_t|
| begBalDiff|The difference between the expected beginning balance (prevBlkBal) and the queried balance from the chain|bigint_t|
| amountIn|For `ETH` txs, the `value` of the transactions if the transaction's `from` address is the same as the `assetAddr`. Otherwise, the value of the ERC20's transfer `amount`.|bigint_t|
| amountOut|The amount (in terms of the asset) of regular income during this tx|bigint_t|
| internalIn|For `ETH` txs only, the value of any internal value transfers into the accountedFor account|bigint_t|
| internalOut|For `ETH` txs only, the value of any internal value transfers out of the accountedFor account|bigint_t|
| selfDestructIn|For `ETH` txs only ending in self-destrution only, the value received by the `accountedFor` account from the self-destructed account|bigint_t|
| selfDestructOut|For `ETH` txs only ending in self-destruct, the value transfered out from the `accountedFor` account|bigint_t|
| minerBaseRewardIn|For blocks won by the `accountedFor` address, this is the base fee reward for the miner.|bigint_t|
| minerNephewRewardIn|For blocks won by the `accountedFor` address, this is the netphew reward for the miner.|bigint_t|
| minerTxFeeIn|For blocks won by the `accountedFor` address, this is the transaction fee reward for the miner.|bigint_t|
| minerUncleRewardIn|For uncle blocks produced by the `accountedFor` address, this is the uncle reward.|bigint_t|
| prefundIn|For block zero (0) only, the amount of preFund income at genesis.|bigint_t|
| gasCostOut|If `accountedFor` address is the transaction's sender (i.e. `from` at the top level), the amount of gas expended denominated in either `ETH` or `WEI`.|bigint_t|
| totalIn|The sum of all In fields|bitint_t|
| totalOut|The sum of all Out fields|bitint_t|
| amountNet|totalIn - totalOut|bigint_t|
| endBal|The ending balance after the transaction acquired by querying the chain (or, if this is the second or subsequent transaction in the same block, this is the ending balance as calculated from the previous transaction in this block)|bigint_t|
| endBalCalc|The ending balance as calculated by `begBal` + amountNet|bigint_t|
| endBalDiff|The difference (if any) between `endBal` and `endBalCalc`|bigint_t|
| reconciled|`true` if `endBal` === `endBalCalc`. `false` otherwise.|bool|
| reconciliationType|One of `regular`, `traces`, or `partial` depending on disposition|string_q|
| reconTrail|A trail of attempts to reconcile intended as an aid in debugging|string_q|
| spotPrice|The price (if available) of the reconciliation in US dollars (note: many times this value is unavailable and must be provided by the end user and/or front end application)|bigint_t|

## Reference of type formats

In these docs, sometimes Trueblocks mentions a type format that is more
precise than the generic types, like "string" or "object".


| Type Name   | Description                              |
| ----------- | ---------------------------------------- |
| blknum_t    | A 64-bit unsigned int                    |
| timestamp_t | A 64-bit unsigned int                    |
| address_t   | A 42 character string starting with '0x' |
| string_q    | A plain c++ string                       |
| uint64_t    | Standard c++ 64-bit unsigned int         |
| bigint_t    | Arbitrarily sized signed bit int         |
| bool        | Standard c++ boolean                     |

