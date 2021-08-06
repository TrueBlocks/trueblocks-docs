---
title: "Accounts"
description: "Explore accounts through associated blockchain data"
lead: ""
date: 2021-06-30T12:13:03-03:00
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
weight: 2100
toc: true
---

TrueBlocks Data collections are built progressively.
Each grouping comprises a building block on which another grouping is created.

_These fields describe the output of various Trueblocks account queries.
For information about how to refine these queries, see
[the corresponding CLI section](/docs/chifra/accounts/)_

## Accounts

_Accounts_ link an address to a known entity.

Accounts are a combination of an`address`, a `name`, and optional other data


### Account fields

|Field|Description|Type (format)|
|----|------------|--------------|
|name|A user-set text string to identify the address|string|
|address|The address of the account|string|required|
|tags|String to link account with other data|string|
symbol|ticker-like symbol to identify an account|string|
source| Text indicating origin of `name`-`address` association|string
is_custom|Whether the name is custom set by user (if `false`, the name shipped with the default `names.tab` folder) |boolean
is_prefund|	|boolean
is_contract|Whether the account is a smart contract|boolean|
is_erc20|Whether the account conforms to the [ERC20 token standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/)|boolean|
|is_erc721|Whether the account conforms to the [ERC721 non-fungible token standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-721/)|boolean



## Monitors actively update collections

If you try to locally monitor every account on a blockchain, you will quickly encounter
storage issues.
To allow you to watch _only the accounts you are interested in_, TrueBlocks offers a data called a monitor.

A _Monitor_ is an [account](#account) or [collection](#collection) that
TrueBlocks continually watches for new transactions.

### Monitor Fields

Running `chifra monitor` returns an array of objects, with the following fields

|Field|Description|Type (format)|
|----|------------|--------------|
|address|The address of the monitor|string|
|blockNumber|The block where the transaction appears|number|
|transactionindex|The transaction's index position on the block|number|


## Tags let you create associations

Through tags, you can associate different objects together.

Running `chifra --tags` lists all tags.



## ABIS

### ABI fields

|Field|Description|Type (format)|
|----|------------|--------------|
|name||string 
|type||string 
|abi_source||string 
|anonymous||boolean
|constant||boolean
|stateMutability||string 
|signature||string 
|encoding|The hash of the signature of the event or the function|string|
message (nowrite)||string 
inputs|Input fields, see below°|array
outputs|Output fields, see below*|array

° **Input/Output fields**

|Field|Description|Type (format)|
|----|------------|--------------|
|type||string|
|name||string|
|internalType||string|

## Funcssigs

## Event sigs
