---
title: "Install"
description: "TrueBlocks works on Linux and Mac."
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 110
toc: true
---

The following instructions help you compile the `core` tools from the TrueBlocks github repo.
If you want to use our browser front-end, see [TrueBlocks Explorer](https://github.com/TrueBlocks/trueblocks-explorer) For a docker image, see link:https://github.com/TrueBlocks/trueblocks-docker[TrueBlocks Docker]

## 1. Install dependencies

**For Linux**:

```shell
sudo apt install build-essential git cmake python python-dev libcurl3-dev clang-format jq
```

**For Mac**:

```shell
brew install cmake
brew install git
brew install clang-format
brew install jq
```

## 2. Compile

```shell
git clone -b develop git@github.com:TrueBlocks/trueblocks-core.git
cd trueblocks-core
mkdir build && cd build
cmake ../src
make -j
```

## 3. Export `./bin` to $PATH

How you do this depends on your preferences. We don't recommend just copying the tools to your `/usr/bin`, because this will have to manually repeat the copy everytime you rebuild TrueBlocks to update it.

## 4. If needed, add keys for your RPC provider

Along with EtherScan, if you want to use `chifra slurp`. 

In `~/.quickBlocks/quickBlocks.toml`, add these lines. Be sure they're under `[settings]`:

```toml
[settings]
rpcProvider = "<url>/<key>
etherscan_key = "<key>"
```

## 5. Test your install.

```shell
chifra blocks 14560
```

