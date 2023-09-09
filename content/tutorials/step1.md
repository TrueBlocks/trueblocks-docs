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

### Step 1 - Configuration

The first thing we need to do is configure TrueBlocks to work with the Sepolia testnet. This involves two steps:

1. Set `sepolia` as the default chain
2. Choose an `rpcProvider` for `sepolia`

#### Making Sepolia the Default Chain

Run this command:

```[bash]
chifra config --paths --fmt json
```

It should produce output similar to this:

```[bash]
{
  "paths": {
    "config": "/home/yourname/.config/chifra",
    "data": "/home/yourname/.local/share/chifra",
    "cache": "/home/yourname/.cache/chifra",
    "log": "/home/yourname/.cache/chifra/log"
  }
}
```

---
[Next >>](/tutorials/step2) | [Home](/tutorials/)
