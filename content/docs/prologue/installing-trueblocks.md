---
title: "Install TrueBlocks"
description: "TrueBlocks works on Linux and Mac"
lead: "TrueBlocks runs on Linux and Mac. There is no official Windows support. Some users have had success using WSL─you're on your own!"
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


<!---
The links in this section are hard coded so that can be pasted into the
directory README.
-->

These instructions assume you can navigate directories with the command line
and edit configuration files.
If you need help with a step, see the [installation's troubleshooting section](https://trueblocks.io/docs/prologue/installing-trueblocks/#troubleshooting).

## Quick Install

0. Install dependencies
    - &#9745; [Install Go, version 1.12x or later](https://golang.org/doc/install).
    - &#9745; Install the other dependencies with your command line `build-essential` `git` `cmake` `python` `python-dev` `libcurl3-dev` `clang-format` `jq`.

1. Compile from the codebase
    ```shell
    git clone -b develop https://github.com/trueblocks/trueblocks-core
    cd trueblocks-core
    mkdir build && cd build
    cmake ../src
    make
    ```
    _(You may use `make -j nproc` to parallelize the build. Replace `<ncores>` with the number of cores on your machine.)_

2. Add `trueblocks-core/bin` to your shell PATH.

3. Find your TrueBlocks configuration directory. It should either be at the location of `$XDG_DATA_HOME`, or:
    * On linux at `~/.local/share/trueblocks`
    * On mac at `~/Library/Application/Support/TrueBlocks`
4. In the configuration directory, edit `trueblocks.toml` to add your RPC and API keys. It should look something like this:
```toml
[settings]
rpcProvider = "<url-to-rpc-endpoint>"
etherscan_key = "<key>"
```
6. Test a command!
```shell
chifra blocks 12345
```
### Optional steps

7. To make deep data queries, [get the index](https://trueblocks.io/docs/prologue/how-can-i-get-the-index/)
8. To explore the data visually, [install the explorer application](https://trueblocks.io/docs/prologue/install-explorer/).

## Troubleshooting

Here are some problems users have run into at each step.
If you're still having trouble, [create an issue](https://github.com/TrueBlocks/trueblocks-core/issues),
or ask us on discord.

### Dependencies

#### How do I check my Go version?

Run this command

```shell
go version
```

TrueBlocks needs version 1.12.x or later.


#### How do I install packages on the command line?

* For Linux

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
### Compiling

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

### Configuring RPCs

#### How do I add my local RPC?

By default, TrueBlocks checks for an RPC on `http://localhost:8545/`.
If you are running a local node on a different port, simply change the port.

#### How do I add external RPCs and etherscan?

If you are using an external RPC, you to need add its endpoint.
Similarly, [some tools have an `--articulate` option](/docs/chifra/chaindata/),
which requires an EtherScan API key.


In your config file, the specific RPC path will differ depending on the service.

Here’s an example for Infura and EtherScan, with <key_value> being replaced by a hash string.

```TOML
[settings]
rpcProvider = "https://mainnet.infura.io/v3/<key_value>"
etherscan_key = "<key_value>"
```

### Why should I get an index?

When you query basic transaction data, you don't need an index.
However, most people want to explore entire histories of addresses, calls, and traces.
Doing that requires an index.

There are multiple options, which the [How Can I Get the Index?](../how-can-i-get-the-index)
article covers in more detail.

No matter what method, getting the index will take somewhere between 10 minutes and a few days.
So you might want to play around with some [chifra blockchain commands](../../chifra/chaindata) first.

