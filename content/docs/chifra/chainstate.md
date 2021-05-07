---
title: "Chain State"
description: ""
lead: ""
date: 2021-05-07T12:59:33
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
menu: 
  docs:
    parent: "chifra"
weight: 30
toc: true
---
## intro
We separate out these few commands into a section called Chain State to distinguish it from blockchain data such as blocks and transactions. Chain state is what changes when blocks and transactions are processed. If you're running a non-archive node, you can query things such as balance and the byte code for smart contracts. If you have an archive node (such as TurboGeth), you can query historical state which comes in very handily when doing reconciliations.
## chifra state

Retrieve the balance (in wei) of an address (or list of addresses) at a given block(s). You may specify multiple addresses and/or multiple blocks, but you must specify at least one address.

This simple program may be used to query an Ethereum address to determine if it is a `smart contract` or simply a regular `external account`. It may also be used to retrieve the byte-code from an address (if present). Finally, it may be used to compare the byte code found at two addresses to determine if they hold identical code. You may specify multiple addresses on a line.

### usage

`Usage:`    chifra state [-p|-c|-n|-v|-h] &lt;address&gt; [address...] [block...]  
`Purpose:`  Retrieve the balance of one or more address at the given block(s).

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
|  | addrs | one or more addresses (0x...) from which to retrieve balances (required) |
|  | blocks | an optional list of one or more blocks at which to report balances, defaults to 'latest' |
| -p | --parts <val> | control which state to export, one or more of [none&#124;some*&#124;all&#124;balance&#124;nonce&#124;code&#124;storage&#124;deployed&#124;accttype] |
| -c | --changes | only report a balance when it changes from one block to the next |
| -n | --no_zero | suppress the display of zero balance accounts |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.
- `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
- If the queried node does not store historical state, the results are undefined.
- `special` blocks are detailed under `whenBlock --list`.
- `balance` is the default mode. To select a single mode use `none` first, followed by that mode.
- You may specify multiple `modes` on a single line.

**Source code**: [`tools/getState`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getState)

## chifra tokens

Given the address of an ERC20 token contract, report token balances for one or more accounts. Alternatively, report token balances for multiple ERC20 contracts for a single account.

In normal operation the **first item** in the `address_list` is considered to be an ERC20 token contract whose balances are queried, whereas the remainder of the list is assumed to be accounts on which to report.

In `--byAcct` mode, **all items** in the `address_list` are assumed to be token contracts, except the last which is the account whose token balances are reported.

You may optionally specify one or more blocks at which to report.

### usage

`Usage:`    chifra tokens [-p|-b|-n|-v|-h] &lt;address&gt; &lt;address&gt; [address...] [block...]  
`Purpose:`  Retrieve token balances for one or more address at given block(s).

`Where:`  

| Hotkey | Option | Description |
| :----- | :----- | :---------- |
|  | addrs | two or more addresses (0x...), the first is an ERC20 token, balances for the rest are reported (required) |
|  | blocks | an optional list of one or more blocks at which to report balances, defaults to 'latest' |
| -p | --parts <val> | one or more parts of the token information to retreive, one or more of [name&#124;symbol&#124;decimals&#124;totalSupply&#124;version&#124;none&#124;all*] |
| -b | --by_acct | consider each address an ERC20 token except the last, whose balance is reported for each token |
| -n | --no_zero | suppress the display of zero balance accounts |
| -v | --verbose | set verbose level. Either -v, --verbose or -v:n where 'n' is level |
| -h | --help | display this help screen |

`Notes:`

- `addresses` must start with '0x' and be forty two characters long.
- `blocks` may be a space-separated list of values, a start-end range, a `special`, or any combination.
- If the token contract(s) from which you request balances are not ERC20 compliant, the results are undefined.
- If the queried node does not store historical state, the results are undefined.
- `special` blocks are detailed under `whenBlock --list`.

**Source code**: [`tools/getTokens`](https://github.com/TrueBlocks/trueblocks-core/tree/master/src/tools/getTokens)

