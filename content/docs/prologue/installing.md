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

**Golang**:

For all operating systems, you must also install GoLang. Please follow [these instructions](https://golang.org/doc/install) to install `golang` on your system. When you're done, run this command

```[shell]
go version
```

Make sure you're running at least Go version 1.12.x or later.

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

`chifra` only works if its underlying tools are found in your $PATH.

Add the full path to `./trueblocks-core/bin` to your shell's default environment. To find the full path, do this

```shell
cd ../bin && pwd && cd -
```

Add the result of that command to your shell's $PATH. If you don't know what we mean, a Google search may be in order...

## Conclusion

On this page, we've shown you how to install TrueBlocks and have gotten your started running `chifra`. All of the chifra commands should now work. The next section further introduces you to `chifra`.

Please see the [Introducing Chifra](/docs/prologue/introducing-chifra/) if you wish to actually get productive.
