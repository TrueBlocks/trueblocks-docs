Kevin11 — Yesterday at 10:08 PM
Just curious why the TrueBlocks caches results as files?

i guess 99% of users don't have this issue but I ran out of inodes
tjayrush — Today at 8:30 AM
On a local machine, caching to a binary file is about as fast as one can get. I've always thought though that this cache could be in a database (either locally or remote). I just never got around to writing that. Mostly because the cache code is currently in C++. We're no longer writing C++ and part of our work for this year is to fully port everything to GoLang. Once we get the cache ported to GoLang, then we have a bunch of easier to implement options.
May I ask the results of chifra list <address> --count shows for the address that blow out the disc space so much so that you ran out of inodes?
(In other words, which address?)
Also, are you caching transactions or traces?
Also, are you using the --accounting options?



-----------------

cryptoguru — Yesterday at 3:10 PM
I did scan the docs, but nothing really stood out to me as the way to define a sort of schema to build an index
Definitely open to any ideas you may have as input
tjayrush — Yesterday at 5:18 PM
So our software works by creating an index of what we call "appearances." An appearance is a <blockNumber.txid> pair list, for each address, where that address appears on the chain. Later, you can query that index to build a list of transactions and only then would you pull the actual transactional (or trace or log) data from the chain. You can choose to do anything you like with that data. By default, it generates either JSON, TXT, or CSV data. We don't impose any sort of database on the data.

This article describes exactly the example you mention -- pulling all UniSwap pairs: https://tjayrush.medium.com/recipe-factories-ce78fa4c5f5b

Another article discusses how to get monthly balances for a collection of accounts: https://tjayrush.medium.com/recipe-monthly-token-balances-ff6a302fda80
Medium
Recipe: Factories
Getting a list of all contracts created by an address
Medium
Recipe: Monthly Token Balances
Or, Just How Bad was my year?
cryptoguru — Yesterday at 11:29 PM
This is an excellent explanation! Thanks for sharing the blog post recipes, seems to be a great practical example with a starting point of how to make use of it for my use case. I'll take a further look and try out the examples! 



-----------------

