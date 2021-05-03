---
title: "Installing TrueBlocks"
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
You may also be interested in the [TrueBlocks Explorer](https://github.com/TrueBlocks/trueblocks-explorer) or the [Docker Version](https://github.com/TrueBlocks/trueblocks-docker)

## Installing Dependencies

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

## Compiling TrueBlocks

```shell
git clone -b develop git@github.com:TrueBlocks/trueblocks-core.git
cd trueblocks-core
mkdir build && cd build
cmake ../src
make -j
```

The compilation should create executable files in `../bin`. Test this with

```shell
../bin/chifra --version
```

You should get a valid version string.

## Adding ./bin to your $PATH

To make TrueBlocks easier to use, add `./trueblocks-core/bin` to your environment's $PATH. To find the full path of the `./bin` folder, do this:

```shell
cd ../bin && pwd && cd -
```

Add the result of that command to your $PATH.

## Introducing chifra

Like the `git` command, TrueBlocks has an overarching command called `chifra` that gives you access to all of the other TrueBlocks commands.

Type:

```shell
chifra
```

You should see a long list of commands. You can get more help on any command with `chifra &lt;cmd&gt; --help.

Let's focus first on the `status` command.

Run this command:

```shell
chifra status
```

If you get a good looking result, your installation is working. Congratulations. You can skip to the 'Using TrueBlocks' section below.

### -- Troubleshooting

Depending on your setup, you may get the following error message when you run `chifra` commands:

```shell
  Warning: A request to your Ethereum node (http://localhost:8545) resulted
  in the following error [Could not connect to server]. Specify a valid
  rpcProvider by editing $CONFIG/trueblocks.toml.
```

If you get this error, edit the configuration file mentioned. The file is very well documented, so refer to that file for further information.

When the `chifra status` command returns a valid response, you may move to the next section. If
you continue to have trouble, join our [discord disscussion](https://discord.gg/kAFcZH2x7K).

## Using chifra

If you've gotten this far, you're ready to use TrueBlocks. Please see the [Using TrueBlocks](/docs/prologue/using/) page for further information. In the meantime, run this command which shows every 10th block between the first and the 100,000th.

```shell
chifra blocks 0-100000:10
```

Hit `Control+C` to stop the processing.

## Conclusion

On this page, we've shown you how to install TrueBlocks, introduced you to `chifra` and helped you setup your RPC provider. All of the `chifra` commands should now work.

Please see the [Using TrueBlocks](/docs/prologue/using/) if you wish to actually get productive.
