---
title: "Other"
description: ""
lead: ""
date: 2021-09-20T18:07:02
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu:
  data:
    parent: "collections"
weight: 1800
toc: true
---

These commands call some useful miscellaneous tools:
* `chifra quotes`, a rudimentary pricing tool,
* `chifra explore` a quick way to open a blockchain explorer,
* `ethslurp` an older tool that lets you call data from EtherScan. (This has issues of ceentralization and data quality, see explanation in its section).

{{< alert icon="👉" title="note about keys"
text="Note: some of these tools, like `ethslurp`, require an EtherScan key." >}}
[Follow these instructions to add a key to your config](https://docs.trueblocks.io/docs/prologue/installing-trueblocks/#3-update-the-configs-for-your-rpc-and-api-keys)

_Each data structure is created by one or more tools which are detailed below_

## Quote

The following commands produce and manage quotes:

| Tools |     |
| ----- | --- |

### How to get price quotes

- **CLI**:
  - run `chifra transactions <txn_id>`.
  - Use the `--articulate` option to turn the `input` field human readable.
  - [See the command's documentation](/docs/chifra/chaindata/#chifra-transactions)
- **API**:
  - [Calls to `/transactions`](/api#operation/chaindata-transactions)

Quote data is made of the following data fields:

| Field     | Description                                           | Type      |
| --------- | ----------------------------------------------------- | --------- |
| timestamp | the timestamp of this quote                           | timestamp |
| close     | price of the asset in US dollars                      | double    |
| date      | the date of the associated timestamp                  | date      |
| name      | the name of the block for some named 'special' blocks | string    |


## Base types

The above documentation mentions the following basic data types.

| Type      | Description                                     | Notes          |
| --------- | ----------------------------------------------- | -------------- |
| date      | a JSON formatted date                           | as a string    |
| double    | a floating point number of double precision     |                |
| string    | a normal character string                       |                |
| timestamp | a 64-bit unsigned integer                       | unix timestamp |
