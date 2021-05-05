---
title: "Installing TrueBlocks"
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

The following instructions help you compile the `core` tools from the TrueBlocks github repo.
You may also be interested in the [TrueBlocks Explorer](https://github.com/TrueBlocks/trueblocks-explorer) or the [Docker Version](https://github.com/TrueBlocks/trueblocks-docker)

## Installing Dependencies

## Prerequisites

---

**Install Go**:

For all operating systems, please follow [these instructions](https://golang.org/doc/install) to install `golang` on your system.

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

We recommend that you run MacOS Big Sur or later for best results.

**For Windows**:

TrueBlocks does not currently support Windows builds.

## Compiling TrueBlocks

```shell
git clone -b develop git@github.com:TrueBlocks/trueblocks-core.git
cd trueblocks-core
mkdir build && cd build
cmake ../src
make
```

(You may use `make -j <ncores>` to parallelize the build. Replace `<ncores>` with the number of cores on your machine.)

The compilation creates a number of executables in `../bin`.

Run this command

```shell
../bin/chifra --version
```

You should get a version string similar to the below

```shell
trueBlocks GHC-TrueBlocks//0.9.0-alpha-409aa9388-20210503
```

If not, review the above commands and make sure you didn't miss something. [Create an issue](https://github.com/TrueBlocks/trueblocks-core/issues) if you continue to have trouble.

## Adding ./bin to your $PATH

`chifra` will only work if its underlying tools are not found in your $PATH.

Add the full path to `./trueblocks-core/bin` to your shell's default environment. To find the full path, do this

```shell
cd ../bin && pwd && cd -
```

Add the result of that command to your shell's $PATH. If you don't know what we mean, a Google search may be in order...

## Introducing chifra

Similar to `git`, TrueBlocks has an overarching command called `chifra` that gives you access to all of the other subcommands.

Type:

```shell
chifra
```

You will see a long list of commands.

You can get more help on any command with `chifra <cmd> --help`.

### Getting status

Let's look at the first subcommand, called `status`.

```shell
chifra status --terse
```

If you get a bunch of JSON data, congratulations, your installation is working. You may skip ahead to the 'Using TrueBlocks' section below.

### -- Troubleshooting

Depending on your setup, you may get the following error message when you run some `chifra` commands:

```shell
  Warning: A request to your Ethereum node (http://localhost:8545) resulted
  in the following error [Could not connect to server]. Specify a valid
  rpcProvider by editing $CONFIG/trueblocks.toml.
```

If you get this error, edit the configuration file mentioned. The file is well documented, so refer to that file for further information.

When the `chifra status` command returns a valid response, you may move to the next section. If
you continue to have trouble, join our [discord disscussion](https://discord.gg/kAFcZH2x7K).

## Using chifra

If you've gotten this far, you're ready to use TrueBlocks. Run this command which shows every 10th block between the first and the 100,000th.

```shell
chifra blocks 0-100000:10
```

Hit `Control+C` to stop the processing.

## Conclusion

On this page, we've shown you how to install TrueBlocks, introduced you to `chifra` and helped you setup your RPC provider. All of the `chifra` commands should now work.

Please see the [Using TrueBlocks](/docs/prologue/using/) if you wish to actually get productive.
