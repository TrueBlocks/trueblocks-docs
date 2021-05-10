---
title: "Introducing Chifra"
description: "First introduction to chifra"
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 0250
toc: true
---

Similar to `git`, TrueBlocks has an overarching command called `chifra` that gives you access to all of the other subcommands.

Type:

```shell
chifra
```

You will see a long list of commands similar to this

<img src="/docs/prologue/introducing-chifra.png" alt="chifra screen" width="800"/>

---
You may get more help on any command by typing `chifra <cmd> --help`.

### Getting status

Let's look at an easy command to get started called `status`.

```shell
chifra status --terse
```

If you get a valid response, congratulations, your installation is working. You may skip ahead to the 'Using TrueBlocks' section below.

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

If you've gotten this far, you're ready to use TrueBlocks.

Let's try another simple command to show Ethereum block data. This command shows every 10th block between the first and the 100,000th.

```shell
chifra blocks 0-100000:10
```

Hit `Control+C` to stop the processing.

This shows one of the basic ideas behind TrueBlocks: make the Ethereum data easier to use.

Play around with other options. See what you can do.

## Conclusion

By this point, you should have TrueBlocks properly installed and be able to get simple blockchain data from your node. All of the chifra commands should now work. The next section further introduces you to `chifra`.

Please see the [Using Chifra](/docs/prologue/using/) page to proceed.
