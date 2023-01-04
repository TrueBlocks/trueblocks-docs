---
title: "Troubleshooting"
description: "Solutions to Common Problems"
lead: "Solutions to common problems."
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
alias:
  - "/docs/prologue/installing-trueblocks"
menu:
  docs:
    parent: "install"
weight: 0500
toc: true
---

This section lists solutions to problems some users have run into with the installation. If you continue to have trouble, [create an issue](https://github.com/TrueBlocks/trueblocks-core/issues), or ask us on discord.

### Dependencies

#### How do I check my Go version?

Run this command

```shell
go version
```

TrueBlocks needs version 1.16.x or later. If you to install or update Go, [see here](https://golang.org/doc/install).


#### How do I install packages on the command line?

**Linux:** `sudo apt install build-essential git cmake ninja-build python3 python3-dev libcurl4-openssl-dev clang-format jq`

**Mac:** `brew install cmake ninja git clang-format jq`

### Compiling

#### How many cores can I use to make TrueBlocks?

When you run `make`, you can speed up the build by parallelizing with

```shell
make -j <ncores>
```

Where `<ncores>` represents the number of cores to devote to the job.
How many cores can you use? That depends on many factors. A handy tool is `nproc`,
which identifies the machine's number of available processing units.

If you have `nproc` installed, you can safely parallelize the build with this command

```shell
make -j `nproc`
```

#### How do I know if compilation was successful?

From the `trueblocks-core` directory, test your install with this command:

```shell
../bin/chifra --version
```

You should get a version string similar to this:

```shell
trueBlocks GHC-TrueBlocks//0.9.0-alpha-409aa9388-20210503
```
If nothing outputs, the build has failed. Try repeating the instructions.
If it still fails, make an issue.

### How do I export to PATH?

`chifra` only works if its underlying tools are found in your `$PATH.`
To find the full path, run this from the top of the `trueblocks-core` directory.

```shell
cd bin && pwd && cd -
```

Add the result of that command to your shell’s `$PATH`.

How you do that depends on your system.
In Bash, you're probably going to put something like this in your `.bashrc`:

```shell
export PATH=${PATH}:</path/to/trueblocks-core/directory>/bin
```

If you are confused, a Google search may be in order…

### Configuration

#### Where is the configuration?

Where your configuration folder is depends on your operating system
and environment.

  - If `XDG_CONFIG_HOME` is set, your configuration is there
  - Otherwise, on Linux: `~/.local/share/trueblocks`
  - Otherwise, on Mac: `~/Library/Application Support/TrueBlocks`
  - Otherwise, you're out of luck--we only support Linux and Mac

The primary or base configuration file (`trueBlocks.toml`) must exist at one
of the above locations for `chifra` to work.

With the recent addition of support for multi-chain, there has arisen the need
for per-chain configuration as well (for example, values such as `rpcProvider` or
`remoteExplorer` are unique per chain).

This issue is discussed here [TODO: PLACE_HOLDER](#).

#### How do I specify an RPC endpoint?

By default, TrueBlocks looks for the RPC at `http://localhost:8545/`.

If you are using a remote RPC such as Infura or your own local RPC at
a different port, you will need to modify that value.

As is true of all configuration values, you coudl use an environment
variable as described above, but you may also edit `trueBlocks.toml`.

The format of that file is documented [TODO: PLACE_HOLDER](#).

#### How do I add a EtherScan key?

Some small part of TrueBlocks requires an EtherScan API key. In particular
this is the [`--articulate` option](/docs/chifra/chaindata/). We are working
hard to remove this centralized dependency, but in the mean time you
may get a warning of a missing key.

Here’s an example of a remote RPC for Infura and an EtherScan API key.
***Warning: see the note below***

```TOML
[settings]
default_chain=mainnet
etherscan_key = "<key_value>"

[mainnet]
rpcProvider = "https://mainnet.infura.io/v3/<key_value>"
```

***Note:*** Until mutli-chain is fully supported, put the `rpcProvider` value
in the `[settings]` group.

***Note:*** The EtherScan key is not *per-chain*.

### Why do I need the index of appearances?

If you're only querying basic block or transaction data, you don't really
need the index of appearances. 

However, most of our users with to explore the entire history of their own
addresses. If you wish to do that, you will need the index.

There are multiple options for getting the index, which the
[How Can I Get the Index?](/docs/install/get-the-index) article covers
in more detail.

No matter which method you use, downloading or creating the index will take
somewhere between a few minutes and a day or two. So you might want to play
around with some [chifra blockchain commands](/docs/chifra/chaindata) first.

### What if my node doesn't have tracing or archiving? {#no-tracing}

If the node you're running does not support OpenEthereum style tracing or it
is not an archive node, you may get an error telling you such.

Something like

> ` --accounting requires historical balances. The RPC server does not have them. Quitting...`

You may disable this warning by editing a configuration file. Find the file
called `blockScrape.toml` in your configuration folder (in a multi-chain environment
this will be in the chain-specific config file, otherwise at the top level).

Add the following setting to the file (which you may create if it doesn't exist):

```toml
[requires]
tracing = false
archive = false
```
