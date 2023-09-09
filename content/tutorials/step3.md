---
title: "Step 3 - Getting Details"
description: ""
date: 2023-09-05T19:25:12+02:00
lastmod:
  - :git
  - lastmod
  - publishDate
draft: false
---

### Step 3 - Getting Details

Let's dig deeper. Let's query specific addresses. In other words, snoop.

**Note:** chances are very high that if you're not running your own node, you will get rate limted with these commands.

Do this:

```[bash]
chifra names GitCoin:Grants | head -30
```

This command lists 30 randomly selected GitCoin grants. The `chifra names` tool allows you to keep track of the addresses you're interested in. Adding the `-s` option shows only the addresses.

```[bash]
chifra names GitCoin:Grants -s | head -30 | tee grants.txt
```

Notice we piped the list of addresses into a file. 

### Getting Balances

The `chifra state` tool allows us to query the balance of a give account. Note how slow this is (TrueBlocks is a work in progress).

```[bash]
chifra state --no_header --chain mainnet --file grants.txt 2>/dev/null
```

A bit slow, but this is the current ether balance of each of the grant receipients. I don't know about you, all other things equal, I'd give to a project with a smaller balance than an larger one. Even if only because they're smart enough to drain thier wallet.

Notice four other things with this command:

1. The `--no_header` option removes the header from the output. This is useful when you're piping the output into another command.
2. The `--chain mainnet` option tells the tool to use the mainnet. If you don't specify a chain, the tool will use the default chain, which is a configuration item.
3. The `--file` option tells the tool to read the list of addresses from the file `grants.txt`. This is a convenience option. You could have just as easily piped the output of the `chifra names` command into the `chifra state` command.

### Getting Token Balances

We leave this part of the tutorial as an excercise. Run `chifra tokens`. Read the help text. Figure out how to get token balances for each of the grant receipients for any token.

### Getting Serious

All this is fun, but let's get serious in the next (and final) step: [Step 4 - Getting Serious](/tutorials/step4).

---
[<< Prev](/tutorials/step2) | [Next >>](/tutorials/step4) | [Home](/tutorials/)
