---
title: "How Trueblocks extracts addresses"
description: ""
date: 2021-04-11T15:45:17-03:00
lastmod: 2021-04-11T15:45:17-03:00
draft: false
images: []
menu:
  docs:
    parent: "concepts"
weight: 110
toc: true

---

In pseudocode:

```python
for each block in blockchain
  for each trans in block.transactions[]
  record miner
  record to
  record from
  extract addrs from input
  record receipt.contractAddress
  for each log in receipt.logs[]
    record emmiterAddress
    for topic in topics[1..,3]
     extract addrs from data
  for trace in traces[]
   from trace.action
     record to
     record from
     recored refundAddr
     extract addrs from input
  from trace.result
    recored contractAddr
    extract addrs from output
```

