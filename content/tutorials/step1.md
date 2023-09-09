---
title: "Step1"
description: ""
date: 2023-09-05T19:25:12+02:00
lastmod:
  - :git
  - lastmod
  - publishDate
draft: false
---

### Prerequisites

Complete the instructions up to [Testing the Build](/tutorials/#to-test-the-build). Make sure your `$PATH` is exported.

### Step 1 - Getting Started

#### Getting Status

Let's review the `chifra status` command. It should produce output similar to this:

```[bash]
09-09|10:58:44.022 Client:            reth/v0.1.0-alpha.8-0f14ec4/aarch64-unknown-linux-gnu (archive, tracing)
09-09|10:58:44.022 TrueBlocks:        GHC-TrueBlocks//1.0.0-release (eskey, pinkey)
09-09|10:58:44.022 RPC Provider:      http://localhost:8545 - sepolia (11155111/11155111)
09-09|10:58:44.022 Root Config Path:  /Users/jrush/Library/Application Support/TrueBlocks/
09-09|10:58:44.022 Chain Config Path: /Users/jrush/Library/Application Support/TrueBlocks/config/sepolia/
09-09|10:58:44.022 Cache Path:        /Users/jrush/Data/trueblocks/v1.0.0/cache/sepolia/
09-09|10:58:44.022 Index Path:        /Users/jrush/Data/trueblocks/v1.0.0/unchained/sepolia/
09-09|10:58:44.022 Progress:          4253158, 4238810, 4238810, 4238810 ts: 4438781
```

#### Getting the Unchained Index

Run this command:

```[bash]
chifra chunks blooms
```

It will most likely complain about not finding the `blooms` filter data. That's because we haven't built the `blooms` filter data  yet. Let's do that now.

Run:

```[bash]
chifra scrape
```



---
[Next >>](/tutorials/step2) | [Home](/tutorials/)
