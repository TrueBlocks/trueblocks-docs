---
title: "Admin"
description: ""
lead: ""
lastmod:
  - :git
  - lastmod
  - publishDate
draft: false
menu:
  data:
    parent: "collections"
weight: 1700
toc: true
---

<!-- markdownlint-disable MD033 MD036 MD041 -->
The data models produced by the tools in the Admin category relate to scraping the chain, producing
the Unchained Index, and querying the configuration of the system. Additional data related to
sharing the indexes via IPFS and pinning the same are also produced by tools in this category.

Each data structure is created by one or more tools which are detailed below.

## Status

<!-- markdownlint-disable MD033 MD036 MD041 -->
The [chifra config](/chifra/admin/#chifra-config) tool reports on the state (and size) of the
various TrueBlocks local binary caches. TrueBlocks produces nine difference caches: `abis`, `blocks`,
`monitors`, `names`, `objs`, `recons`, `slurps`, `traces`, `txs`. In general practice, these caches
may take up a few GB of hard drive space, however, for very popular smart contract the size of the
caches may grow rather large. Keep an eye on it.

The `status` data model is a complex beast. It contains various information including a list of
registered chains, information about many of the internal binary caches maintained by `chifra`
as well as current status information about the system including version information for both
`chifra` and the node it's running against.

The following commands produce and manage Statuses:

- [chifra config](/chifra/admin/#chifra-config)

Statuses consist of the following fields:

| Field             | Description                                              | Type                                |
| ----------------- | -------------------------------------------------------- | ----------------------------------- |
| clientVersion     | the version string as reported by the rpcProvider        | string                              |
| clientIds         | netword_id and chain_id from the rpcProvider             | string                              |
| trueblocksVersion | the TrueBlocks version string                            | string                              |
| rpcProvider       | the current rpcProvider                                  | string                              |
| configPath        | the path to config files                                 | string                              |
| cachePath         | the path to the local binary caches                      | string                              |
| indexPath         | the path to the local binary indexes                     | string                              |
| host              | the host portion of the local API server                 | string                              |
| isTesting         | `true` if the server is running in test mode             | bool                                |
| isApi             | `true` if the server is running in API mode              | bool                                |
| isScraping        | `true` if the index scraper is running                   | bool                                |
| isArchive         | `true` if the rpcProvider is an archive node             | bool                                |
| isTracing         | `true` if the rpcProvider provides Parity traces         | bool                                |
| hasEskey          | `true` if an EtherScan key is present                    | bool                                |
| hasPinkey         | `true` if a Pinata API key is present                    | bool                                |
| ts                | the timestamp when this status data was produced         | timestamp                           |
| chains            | the list of configured chains                            | [Chain[]](/data-model/admin/#chain) |
| caches            | a collection of information concerning the binary caches | [Cache[]](/data-model/admin/#cache) |

## Manifest

<!-- markdownlint-disable MD033 MD036 MD041 -->
The Manifest details the index of appearance's PinnedChunks. Each record in the Manifest details
the block range represented by the chunk as well as the IPFS hash of the index chunk along with
the associated IPFS hash for the Bloom filter of the chunk. The manifest itself is also pushed
to IPFS and the IPFS of the hash of the manifest is published periodically to the Unchained Index
smart contract.

The following commands produce and manage Manifests:

- [chifra chunks](/chifra/admin/#chifra-chunks)
- [chifra init](/chifra/admin/#chifra-init)
- [chifra scrape](/chifra/admin/#chifra-scrape)

Manifests consist of the following fields:

| Field     | Description                                                           | Type                                            |
| --------- | --------------------------------------------------------------------- | ----------------------------------------------- |
| version   | the version string hashed into the chunk data                         | string                                          |
| chain     | the chain to which this manifest belongs                              | string                                          |
| schemas   | IPFS cid of file describing the schemas for the various databases     | ipfshash                                        |
| databases | IPFS cid of file containing CIDs for the various databases            | ipfshash                                        |
| chunks    | a list of the IPFS hashes of all of the chunks in the unchained index | [PinnedChunk[]](/data-model/admin/#pinnedchunk) |

## PinnedChunk

<!-- markdownlint-disable MD033 MD036 MD041 -->
The TrueBlocks index scraper periodically creates a chunked portion of the index so that it can
be more easily stored in a content-addresable data store such as IPFS. We call these
periodically-created chunks, PinnedChunks. The format of said item is described here. A pinned
chunk is effectively a relational table relating all of the addresses appearing in the chunk
with a list of appearances appearing in the chunk.

The following commands produce and manage PinnedChunks:

- [chifra chunks](/chifra/admin/#chifra-chunks)
- [chifra init](/chifra/admin/#chifra-init)
- [chifra scrape](/chifra/admin/#chifra-scrape)

PinnedChunks consist of the following fields:

| Field     | Description                                                 | Type     |
| --------- | ----------------------------------------------------------- | -------- |
| range     | for each chunk, the range of blocks contained in that chunk | string   |
| bloomHash | the IPFS hash of the bloom filter at that range             | ipfshash |
| indexHash | the IPFS hash of the index chunk at that range              | ipfshash |
| firstApp  | the first appearance in the chunk                           | blknum   |
| latestApp | the latest appearance in the chunk                          | blknum   |

## ChunkIndex

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `indexchunk` data model represents internal information about each Unchained Index index chunk.
It is used mostly interenally to study the characteristics of the Unchained Index.

The following commands produce and manage ChunkIndexes:

- [chifra chunks](/chifra/admin/#chifra-chunks)

ChunkIndexes consist of the following fields:

| Field           | Description                                                        | Type       |
| --------------- | ------------------------------------------------------------------ | ---------- |
| range           | The block range (inclusive) covered by this chunk                  | blockRange |
| magic           | An internal use only magic number to indicate file format          | string     |
| hash            | The hash of the specification under which this chunk was generated | hash       |
| addressCount    | The number of addresses in this chunk                              | uint64     |
| appearanceCount | The number of appearances in this chunk                            | uint64     |
| size            | The size of the chunk in bytes                                     | uint64     |

## ChunkBlooms

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `blooms` data model represents the bloom filter files that front the Unchained Index index
portions. The information here is mostly for internal use only as it includes the size and number
of the bloom filters present as well as the number of addresses inserted into the bloom. This
information is used to study the characteristics of the Unchained Index.

The following commands produce and manage ChunkBlooms:

- [chifra chunks](/chifra/admin/#chifra-chunks)

ChunkBlooms consist of the following fields:

| Field     | Description                                                        | Type       |
| --------- | ------------------------------------------------------------------ | ---------- |
| range     | The block range (inclusive) covered by this chunk                  | blockRange |
| magic     | An internal use only magic number to indicate file format          | string     |
| hash      | The hash of the specification under which this chunk was generated | hash       |
| count     | The number of individual bloom filters in this bloom file          | uint64     |
| nInserted | The number of addresses inserted into the bloom file               | uint64     |
| size      | The size on disc in bytes of this bloom file                       | uint64     |
| width     | The width of the bloom filter                                      | uint64     |

## ChunkAddresses

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `addresses` data model is produced by `chifra chunks` and represents the records found in the
addresses table of each Unchained Index chunk. The `offset` and `count` fields represent the
location and number of records in the `appearances` table to which the address table is related.

The following commands produce and manage ChunkAddresses:

- [chifra chunks](/chifra/admin/#chifra-chunks)

ChunkAddresses consist of the following fields:

| Field   | Description                                                               | Type       |
| ------- | ------------------------------------------------------------------------- | ---------- |
| address | The address in this record                                                | address    |
| range   | The block range of the chunk from which this address record was taken     | blockRange |
| offset  | The offset into the appearance table of the first record for this address | uint64     |
| count   | The number of records in teh appearance table for this address            | uint64     |

## ChunkAppearances

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `appearances` data model is the second of two tables inside of the Unchained Index chunks. The
other is the `addresses` table which relates the addresses in that table to this table via the
`offset` and `count` fields.

The following commands produce and manage ChunkAppearances:

- [chifra chunks](/chifra/admin/#chifra-chunks)

ChunkAppearances consist of the following fields:

| Field            | Description                              | Type   |
| ---------------- | ---------------------------------------- | ------ |
| blockNumber      | The block number of this appearance      | uint64 |
| transactionIndex | The transaction index of this appearance | uint64 |

## ChunkStats

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `stats` data model is produced by `chifra chunks` and brings together various statistical
information such as average number of addresses in an Unchained Index chunk among other information.

The following commands produce and manage ChunkStats:

- [chifra chunks](/chifra/admin/#chifra-chunks)

ChunkStats consist of the following fields:

| Field         | Description                                      | Type   |
| ------------- | ------------------------------------------------ | ------ |
| start         | the first block in the chunk's range             | uint64 |
| end           | the last block in the chunk's range              | uint64 |
| nAddrs        | the number of addresses in the chunk             | uint64 |
| nApps         | the number of appearances in the chunk           | uint64 |
| nBlocks       | the number of blocks in the chunk                | uint64 |
| nBlooms       | the number of bloom filters in the chunk's bloom | uint64 |
| recWid        | the record width of a single bloom filter        | uint64 |
| bloomSz       | the size of the bloom filters on disc in bytes   | uint64 |
| chunkSz       | the size of the chunks on disc in bytes          | uint64 |
| addrsPerBlock | the average number of addresses per block        | double |
| appsPerBlock  | the average number of appearances per block      | double |
| appsPerAddr   | the average number of appearances per address    | double |
| ratio         | the ratio of appearances to addresses            | double |

## Cache

<!-- markdownlint-disable MD033 MD036 MD041 -->
The [chifra config <type>](/chifra/admin/#chifra-config) reports on the binary caches. Those
reports come in the form of the Cache data type. Each cache data object may carry unique
information for the given cache. See the source code for more information.

The following commands produce and manage Caches:

- [chifra config](/chifra/admin/#chifra-config)

Caches consist of the following fields:

| Field       | Description                                             | Type                                          |
| ----------- | ------------------------------------------------------- | --------------------------------------------- |
| type        | the type of the cache (one of the nine different types) | string                                        |
| path        | the physical path to the cache on the hard drive        | string                                        |
| nFiles      | the number of files in the cache                        | uint64                                        |
| nFolders    | the number of subfolders in the cache                   | uint64                                        |
| sizeInBytes | the size of the cache in bytes                          | uint64                                        |
| items       | an array of cache items                                 | [CacheEntry[]](/data-model/admin/#cacheentry) |

## CacheEntry

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `cacheEntry` data model is used to display various caches displayed from the `chifra config`
tool.

The following commands produce and manage CacheEntries:

- [chifra config](/chifra/admin/#chifra-config)

CacheEntries consist of the following fields:

| Field   | Description | Type    |
| ------- | --- | ------- |
| address |     | address |
| name    |     | string  |

## IndexCacheItem

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `indexCacheItem` is used to present a single Unchained Index chunk in the Explorer app.

The following commands produce and manage IndexCacheItems:

- [chifra config](/chifra/admin/#chifra-config)

IndexCacheItems consist of the following fields:

| Field          | Description                                          | Type      |
| -------------- | ---------------------------------------------------- | --------- |
| nAddrs         | the number of addresses in this chunk                | uint32    |
| nApps          | the number of appearances in this chunk              | uint32    |
| firstApp       | the first appearance in this chunk                   | blknum    |
| latestApp      | the last appeaerance in this chunk                   | blknum    |
| firstTs        | the first timestamp in this chunk                    | timestamp |
| latestTs       | the last timestamp in this chunk                     | timestamp |
| filename       | the filename of this chunk                           | string    |
| fileDate       | the file date of this chunk                          | datetime  |
| indexSizeBytes | the size in bytes of the index portion of this chunk | uint32    |
| indexHash      | the IPFS hash of the index portion of this chunk     | ipfshash  |
| bloomSizeBytes | the size in bytes of the bloom filter for this chunk | uint32    |
| bloomHash      | the IPFS has of the bloom filter for this chunk      | ipfshash  |

## Chain

<!-- markdownlint-disable MD033 MD036 MD041 -->
The `chain` data model represents the configured chain data found in the `trueBlocks.toml`
configuration file.

The following commands produce and manage Chains:

- [chifra config](/chifra/admin/#chifra-config)

Chains consist of the following fields:

| Field          | Description                                                      | Type   |
| -------------- | ---------------------------------------------------------------- | ------ |
| chain          | The common name of the chain                                     | string |
| chainId        | The chain id as reported by the RPC                              | uint64 |
| symbol         | The symbol of the base currency on the chain                     | string |
| rpcProvider    | A valid RPC provider for the chain                               | string |
| apiProvider    | A valid API provider for the explorer                            | string |
| remoteExplorer | A remote explorer for the chain such as EtherScan                | string |
| localExplorer  | The local explorer for the chain (typically TrueBlocks Explorer) | string |
| ipfsGateway    | An IPFS gateway for pinning the index if enabled                 | string |

## Base types

This documentation mentions the following basic data types.

| Type      | Description                         | Notes          |
| --------- | ----------------------------------- | -------------- |
| address   | an '0x'-prefixed 20-byte hex string | lowercase      |
| blknum    | an alias for a uint64               |                |
| bool      | either `true`, `false`, `1`, or `0` |                |
| datetime  | a JSON formatted date               | as a string    |
| double    | a double precision float            | 64 bits        |
| hash      | an '0x'-prefixed 32-byte hex string | lowercase      |
| ipfshash  | a multi-hash produced by IPFS       | mixed-case     |
| string    | a normal character string           |                |
| timestamp | a 64-bit unsigned integer           | Unix timestamp |
| uint32    | a 32-bit unsigned integer           |                |
| uint64    | a 64-bit unsigned integer           |                |
