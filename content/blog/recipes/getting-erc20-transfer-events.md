---
title: "Getting Erc20 Transfer Events"
description: ""
lead: ""
date: 2021-04-13T08:00:02-04:00
lastmod: 2021-04-13T08:00:02-04:00
draft: false
weight: 50
images: ["getting-erc20-transfer-events.jpg"]
contributors: []
---

Just as a hint as to what I will be writing about. I do this:

```[bash]
chifra list 0x03fdcadc09559262f40f5ea61c720278264eb1da
```

which hits against our index and tells me there are 2,129 appearances of that address anywhere on the chain (not just to and from which is what Etherscan returns).

I then do:

```[bash]
chifra export --logs --articulate --fmt csv 0x03fdcadc09559262f40f5ea61c720278264eb1da
```

which generates 8,115 logs entries of any type for that address. If I then do (using linux's grep):

```[bash]
chifra export --logs --articulate --fmt csv 0x03fdcadc09559262f40f5ea61c720278264eb1da | grep Transfer
```

I get the 3,317 Transfer events. Then, I would do:

```[bash]
chifra export --logs --articulate --fmt csv 0x03fdcadc09559262f40f5ea61c720278264eb1da | grep Transfer | cut -d, -f1,2,11-100
```

To get just the blockNumber, transactionIndex, and the transfers (I've attached a file below).
