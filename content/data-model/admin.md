---
title: "Admin"
description: ""
lead: ""
date: 2021-09-20T18:36:15
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
weight: 1700
toc: true
---

Tools in the Admin category produce data related to scraping the chain, producing the indexes, and querying the status of the system. Additional data related to sharing the indexes via IPFS and pinning the same are also produced by tools in this category.

## Status

The [chifra status](/docs/chifra/admin/#chifra-status) tool reports on the state (and size) of the various TrueBlocks local binary caches. TrueBlocks produces nine difference caches: `abis`, `blocks`, `monitors`, `names`, `objs`, `prices`, `recons`, `slurps`, `traces`, `txs`. In general practice, these caches may take up a few GB of hard drive space, however, for very popular smart contract the size of the caches may grow rather large. Keep an eye on it.

The following commands produce and manage status:

| Tools                                              |                                               |
| -------------------------------------------------- | --------------------------------------------- |
| [chifra status](/docs/chifra/admin/#chifra-status) | report on the status of the TrueBlocks system |

Status data is made of the following data fields:

| Field              | Description                                                         | Type      |
| ------------------ | ------------------------------------------------------------------- | --------- |
| client_version     | the version string as reported by the rpcProvider                   | string    |
| client_ids         | netword_id and chain_id from the rpcProvider                        | string    |
| trueblocks_version | the TrueBlocks version string                                       | string    |
| rpc_provider       | the current rpcProvider                                             | string    |
| balance_provider   | the current archive node balance provider (defaults to rpcProvider) | string    |
| config_path        | the path to config files                                            | string    |
| cache_path         | the path to the local binary caches                                 | string    |
| index_path         | the path to the local binary indexes                                | string    |
| host               | the host portion of the local API server                            | string    |
| is_testing         | `true` if the server is running in test mode                        | bool      |
| is_api             | `true` if the server is running in API mode                         | bool      |
| is_docker          | `true` if running under a docker image                              | bool      |
| is_scraping        | `true` if the index scraper is running                              | bool      |
| is_archive         | `true` if the rpcProvider is an archive node                        | bool      |
| is_tracing         | `true` if the rpcProvider provides Parity traces                    | bool      |
| has_eskey          | `true` if an EtherScan key is present                               | bool      |
| has_pinkey         | `true` if a Pinata API key is present                               | bool      |
| ts                 | the timestamp when this status data was produced                    | timestamp |


## Cache

The [chifra status <type>](/docs/chifra/admin/#chifra-status) reports on the binary caches. Those reports come in the form of the Cache data type. Each cache data object may carry unique information for the given cache. See the source code for more information.

The following commands produce and manage caches:

| Tools                                              |                                               |
| -------------------------------------------------- | --------------------------------------------- |
| [chifra status](/docs/chifra/admin/#chifra-status) | report on the status of the TrueBlocks system |

Cache data is made of the following data fields:

| Field       | Description                                             | Type   |
| ----------- | ------------------------------------------------------- | ------ |
| type        | the type of the cache (one of the nine different types) | string |
| path        | the physical path to the cache on the hard drive        | string |
| nFiles      | the number of files in the cache                        | uint64 |
| nFolders    | the number of subfolders in the cache                   | uint64 |
| sizeInBytes | the size of the cache in bytes                          | uint64 |


## PinnedChunk

The following commands produce and manage pinnedchunks:

| Tools |     |
| ----- | --- |

### How to get pinnedchunks

- **CLI**:
  - Run `chifra pins <options>`
  - [See the command's documentation](/docs/chifra/admin/#chifra-pins)
- **API**:
  - [Calls to `/pins`](/api#operation/admin-pins)

Pinnedchunk data is made of the following data fields:

| Field     | Description                                                 | Type     |
| --------- | ----------------------------------------------------------- | -------- |
| fileName  | for each chunk, the range of blocks contained in that chunk | string   |
| bloomHash | the IPFS hash of the bloom filter at that range             | ipfshash |
| indexHash | the IPFS hash of the index chunk at that range              | ipfshash |


## Manifest


| Field       | Description                                                     | Type              |
| ----------- | --------------------------------------------------------------- | ----------------- |
| indexFormat | IPFS cid of file describing the file format of an index chunk   | string            |
| bloomFormat | IPFS cid of file describing the assoicated bloom filter         | string            |
| firstPin    | the block number of the first pin in the manifest (always zero) | blknum            |
| lastPin     | the most recent block included in this manifest                 | blknum            |
| pins        | a list of all the pins in the unchained index                   | CPinnedChunkArray |

## Base types

The above documentation mentions the following basic data types.

| Type      | Description                                     | Notes          |
| --------- | ----------------------------------------------- | -------------- |
| blknum    | an alias for a uint64                           |                |
| bool      | a value either `true`, `false`, `1`, or `0`     |                |
| ipfshash  | a multi-hash produced by IPFS                   | mixed-case     |
| string    | a normal character string                       |                |
| timestamp | a 64-bit unsigned integer                       | unix timestamp |
| uint64    | a 64-bit unsigned integer                       |                |
