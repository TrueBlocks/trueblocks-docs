---
title: "Step 1 - Getting Started"
description: ""
date: 2023-09-05T19:25:12+02:00
lastmod:
  - :git
  - lastmod
  - publishDate
draft: false
---

#### Getting status

Let's review the `chifra status` command. It should produce output similar to this:

```[plaintext]
Client:               reth/v0.1.0-alpha.8-0f14ec4/aarch64-unknown-linux-gnu (archive, tracing)
TrueBlocks:           GHC-TrueBlocks/1.0.0-release (eskey, pinkey)
RPC Provider:         localhost:8545 - sepolia (11155111/11155111)
Root Config Path:     /Users/jrush/Library/Application Support/TrueBlocks/
Chain Config Path:    /Users/jrush/Library/Application Support/TrueBlocks/config/sepolia/
Cache Path:           /Users/jrush/Data/trueblocks/v1.0.0/cache/sepolia/
Index Path:           /Users/jrush/Data/trueblocks/v1.0.0/unchained/sepolia/
Progress:             4253158, 0, 0, 0 ts: 4438781
```

**A few things you'll notice:**

1. The paths listed in the middle of the output may come in handy as you debug your configuration.
2. The final line shows five numbers:
   - The first number is the lastest block on the chain.
   - The last number is the latest timestamps TrueBlocks knows about.
   - The three middle numbers are related to building the index. We can ignore them for now.

#### Getting the Unchained Index

Run the following command which is designed to display the current state of the index. It will report an error.

```[bash]
chifra chunks blooms
```

This will fail. It's complaining about initialization. It suggests either `chifra init` or `chifra scrape`. Let's
try `chifra scrape`.

Run:

```[bash]
chifra scrape
```

This also complains, but for a different reason. Here, it's telling you that you need a tracing node. This is one of the reasons why you would want to run your own node. If you don't have a tracing node, you can still use TrueBlocks, but it will be slower and less accurate.

#### Getting the Unchained Index redux

let's try `chifra init`.

```[bash]
chifra init
```

This will download the index from a Pinata IPFS gateway. It will take a few minutes, but when it's done, you should be able to rerun the above `chifra chunks index` command and get useful data.

```[bash]
chifra chunks blooms
```

You should now see data. In [Step 2 - Getting Data](/tutorials/step2), we'll explore using TrueBlocks for what it's good for. Getting transactional histories for any account.

---
[Next >>](/tutorials/step2) | [Home](/tutorials/)
