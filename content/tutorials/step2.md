---
title: "Step 2 - Getting Data"
description: ""
date: 2023-09-05T19:25:12+02:00
lastmod:
  - :git
  - lastmod
  - publishDate
draft: false
---

Now, we're finally able to get some data from the chain. But are we? Let's find out.

Do this command:

```[bash]
chifra
```

TrueBlocks is a collection of sub-tools. Notice the two groups: `Chain Data` and `Chain State`. Similar to the RPC, these tools pull data directly from the node. With a few improvements...

### Getting data

Try any of these commands:

```[bash]
chifra blocks 2001007
chifra transactions --fmt json 0xc9c5f47ed17445070a68fab0c5336f39e6a70a74c67c8fce2a586b5f6596b3fb
chifra receipts --fmt json 4001009.32
chifra logs --fmt json 0xc9c5f47ed17445070a68fab0c5336f39e6a70a74c67c8fce2a586b5f6596b3fb
```

They bring straight, raw PRC data from the node. Try adding `--cache` to each of the above commands? What happens? Did it get faster? Why?

Let's try something a bit more complicated:

```[bash]
chifra receipts 2010732.\* --fmt csv
```

This is every receipt (or log, or transaction, or trace if you have a tracing node) in the given block.

### Getting rate limited

How about a block with a lot of transacitons? Try this:

```[bash]
chifra logs 4001009.\* --fmt csv
```

**Important:** If you get rate limited, don't run the command again. They may cut you off permenantly.

Did you get rate limited? We didn't.

### **Lesson 1**

Decentralizing your data source brings a number of massive upsides to you.

1. There is no arbitrary rate limit to the data. You're not sharing.
2. The API provider cannot be spying on you. There is no API provider.
3. With greater speed, comes greater insight into what's going on.

No matter what Web 2.0 API providers do, they MUST rate limit you. If they didn't, they would be swamped with requests. Plus -- price. Plus -- privacy. Why wait?

### Yeah. But I really want an API

Every chifra command is available through a local API server. Try this:

In one window:

```[bash]
chifra server
```

In another window:

```[bash]
curl "http://localhost:8080/blocks?blocks=2001007"
```

### Getting names / abis / dates

Chifra provides a lot other very useful tools. Check them out.

```[bash]
chifra names
chifra names vitalik.eth
chifra names unchainedindex.eth
chifra when 4001001                                                       # by block
chifra when 1690827372                                                    # by timestmap
chifra when 2023-07-31T18:16:12                                           # by date
chifra when 2000000-4000000:weekly                                        # time period ranges
chifra abis --chain mainnet 0x6b175474e89094c44da98b954eedeac495271d0f    # requires an Etherscan key
```

### What's next?

In the next step, [Step 3 - Getting Details](/tutorials/step3) we're going to look a bit deeper.

---
[<< Prev](/tutorials/step1) | [Next >>](/tutorials/step3) | [Home](/tutorials/)
