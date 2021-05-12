---
title: Announcing QuickBlocks®
lead: Finally...
date: '2017-10-29T18:07:27.150Z'
draft: false
categories: []
keywords: []
slug: /@tjayrush/announcing-quickblocks-861c4f0c6a52
---

We are pleased to announce the release today of the first of three white papers describing QuickBlocks: [Faster, Richer, Fully Customizable Data from Programmable Blockchains](http://quickblocks.io/wp-content/uploads/2017/10/2017-Rush-Faster-Richer-Fully-Customizable-Data-from-Programmable-Blockchains.pdf). Additionally, we are announcing the release of an updated and improved website ([http://quickblocks.io](http://quickblocks.io)) as well as fourteen open-source command line tools.

![](/blog/medium-posts/img/020-Announcing-QuickBlocks-001.png)
undefined

#### What is QuickBlocks

QuickBlocks is a collection of software libraries, open source command-line tools, and applications intended to improve the ease and speed with which one may access data from the Ethereum blockchain. Given fast, easily accessible data, new use cases and applications such as smart contract monitoring, per-block accounting, and integration with business intelligence tools such as Tableau become possible.

#### Open Source Command-Line Tools

As part of our commitment to the Ethereum community, we offer fourteen open source command-line tools including:

*   **getBalance** and **getTokenBal**: which report on ether and token balances respectively for one or more Ethereum address. Reporting for any of three denominations (ether, wei, or US dollar fiat) is a simple command line option.
*   **getBlock**, **getTrans**, **getReceipt**, **getTrace**, **getLogs**, **getBloom**: each of which reports on a particular data structure given one or more block hashes, transaction hashes, block numbers/transaction id pairs, or any combination.
*   **ethName**, **whenBlock**, **isContract**, and **whereBlock**: tools useful in retrieving information about Ethereum account names, when certain blocks occurred, whether or not certain blocks are cached or reside on the node, and whether or not an Ethereum address is a smart contract.

#### Examples of Using the Command Line Tools

Having been born and raised in a Linux only shop, each of these tools works and plays well with the Linux philosophy of feeding the output of one command into the next, so you can do something like:

ethName omisigo -a

to get the address of the Omisigo smart contract. You can also do:

getAccounts

to list all of the accounts held on your local wallet. Stringing these two commands together and feeding the output into **getTokenBal** yields:

getTokenBal \`ethName omisigo -a\` \`getAccounts\`

which reports on the number of Omisigo tokens one holds. You can furthermore use a tool such as `whenBlock` to deliver monthly, weekly, or daily reports on your holding. Each tool accepts a`--dollar` option which converts ether into dollar spot prices.

![](/blog/medium-posts/img/020-Announcing-QuickBlocks-002.png)
undefined

To be honest, the combinations are nearly endless. Check out [our documentation](http://quickblocks.io/docs/index.html) for more information.

#### Where to from Here?

We have many plans for the software including some unique takes on how to deal with the Ethereum data. We’ll be presenting some of our ideas over the coming month with the release of two more nearly complete white papers. We welcome any and all participation and look forward to your interest in our work. We will be at DevCon 3. [Contact us](http://quickblocks.io/#contact) through our website. We’d love to talk to you.

We’re interested in your thoughts. Please clap for us and post your comments below. Please consider supporting our work by sending a small tip to 0xB97073B754660BB356DfE12f78aE366D77DBc80f.

**Thomas Jay Rush** owns the software company QuickBlocks whose primary project is also called QuickBlocks, a collection of software libraries and applications enabling real-time, per-block smart contract monitoring and analytics to the Ethereum blockchain. Contact him through [the website](http://www.quickblocks.io).
