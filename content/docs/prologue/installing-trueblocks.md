---
title: "How to Install TrueBlocks"
description: "TrueBlocks works on Linux and Mac"
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 0200
toc: true
---

To use the core tools of TrueBlocks, you need to go through a few installation steps.

0. Install dependencies
1. Compile from the codebase
2. Add `trueblock-core/bin` to your shell PATH.
3. Update configs for your RPC endpoints and API keys

_Optional steps:_

4. To use all features, get your index.
5. To explore the data visually, install the explorer application.

## Install

The following instructions walk you through these steps with a bit more context.
If you have any trouble, you might want to jump to the corresponding section in [troubleshooting](#how-do-i-check-my-go-version).

### 0. Install dependencies

1. Install Go with [these instructions from the GoLang website](https://golang.org/doc/install).
TrueBlocks requires Go version 1.12.x or later.

2. Install the other prereqs with your CLI:

* For Linux:

  ```shell
  sudo apt install build-essential git cmake python python-dev libcurl3-dev clang-format jq
  ```

* For Mac:

  _For best results, we recommend running MacOS Big Sur or later._  

  ```shell
  brew install cmake
  brew install git
  brew install clang-format
  brew install jq
  ```

* For Windows:

  TrueBlocks does not currently support Windows builds.
  Some users have had luck using WSL. For now─you’re on your own!

### 1. Compile

1.1 Clone the repo and compile

```shell
git clone -b develop https://github.com/trueblocks/trueblocks-core
cd trueblocks-core
mkdir build && cd build
cmake ../src
make
```

_(You may use `make -j <ncores>` to parallelize the build. Replace `<ncores>` with the number of cores on your machine.)_

1.2 Test your install with this command

```shell
../bin/chifra --version
```

You should get a version string similar to this:

```shell
trueBlocks GHC-TrueBlocks//0.9.0-alpha-409aa9388-20210503
```

If you didn't, see the [corresponding section in troubleshooting](#no-version-outputted).

### 2. Add `trueblocks-core/bin` to PATH

`chifra` only works if its underlying tools are found in your $PATH.
For guidance, see the [corresponding section in troubleshooting](#adding-bin-to-path).

### 3. Update the configs for your RPC and API keys

3.1 To add your RPC endpoints and API keys, add these lines to `trueBlocks.toml` under `[settings]`:

```toml
[settings]
rpcProvider = "<url-to-rpc-endpoint>"
etherscan_key = "<key>"
```

The location of your config file depends on your OS and your environment
settings.
For help, see [Where is my config file?](#where-is-my-config-file).

By default, TrueBlocks checks for an RPC on `http://localhost:8545/`.
If you are running a local node on a different port, simply change the port.
If you are using an external RPC, you to need add its endpoint.
Similarly, [some tools have an `--articulate` option](https://docs.trueblocks.io/docs/chifra/chaindata/),
which requires an EtherScan API key.

3.2 Test the install with a chifra command! This one returns data about block 100.

```shell
chifra blocks 100
```

### 4. Get your index

When you query basic transaction data, you don't need an index.
However, most people want to explore entire histories of addresses, calls, and traces.
Doing that requires an index.

There are multiple options, which the [How Can I Get the Index?](../how-can-i-get-the-index)
article covers in more detail.

No matter what method, getting the index will take somewhere between 10 minutes and a few days.
So you might want to play around with some [chifra blockchain commands](../../chifra/chaindata) first.

### 5. Build the explorer app

If you live in the terminal, the preceding instructions have already given you what you need.

Most people prefer to explore data visually. To do that, you need
[to install the Explorer browser application](../install-explorer).


## Troubleshooting

Here are some problems users have run into at each step. If you're still having trouble, [create an issue](https://github.com/TrueBlocks/trueblocks-core/issues).

### Dependencies

#### How do I check my Go version?

```shell
go version
```

TrueBlocks needs version 1.12.x or later.

### Compiling

#### No version outputted

From the top of the trueblocks-core repo, check your version with `bin/chifra --version`.
If nothing outputs, then the build has failed.
Please make sure you’ve reviewed the commands in steps 0 and 1.
If you continue to have trouble, create an issue.

### Adding bin to path

Add the full path to `trueblocks-core/bin` to your shell’s default environment.
To find the full path, run this from the top of the `trueblocks-core` directory.

```shell
cd bin && pwd && cd -
```

Add the result of that command to your shell’s `$PATH`.
How you do that depends on your system.
If you are confused, a Google search may be in order…

### Adding configs

#### Where is my config file?

TrueBlocks follows the [XDG base directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) spec.

The location of `trueBlocks.toml` (and all other configs) depends on the value of your `$XDG_DATA_HOME` variable.
By default, this is:

* On linux at `~/.local/share/trueblocks`
* On mac at `~/Library/Application/Support/TrueBlocks`

If the config is not there, someone has set a value your default data directory!
Run `echo $XDG_DATA_HOME`, and hopefully you'll know what to do :-).

#### How do I add a remote RPC?

In your config file, the specific RPC path will differ depending on the service.

Here's an example for Infura and EtherScan, with `<key_value>` being replaced by a hash string.

```toml
[settings]
rpcProvider = "https://mainnet.infura.io/v3/<key_value>"
etherscan_key = "<key_value>"
```

