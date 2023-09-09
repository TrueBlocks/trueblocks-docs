---
title: "Tutorials"
description: "Learn how to use TrueBlocks, chifra, and the Unchained Index."
date: 2023-09-05T19:25:12+02:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: false
images: []
layout: single
---

<!-- smarkdownlint-disable -->

An interactive demonstration of TrueBlocks at dAppCon Berlin 2023.

### Prior to Attending the Session

To save time for everyone, please complete the [Prerequisites](#prerequisites) before you come.

### What We Hope to Accomplish

Accessing Ethereum data from a locally running Ethereum node is orders of magnitude faster than accessing it remotely.

We say that above statement frequently. I don't think people realize what we mean. 

We're going to make the above statement so obvious to you that you will never want to use an old-fashioned Web 2.0 API again.

### Tasks

- [Prerequisites](#prerequisites)
- [Building TrueBlocks](#building-trueblocks)
- [Step 1](step1)
- [Step 2](step2)
- [Step 3](step3)
- [Step 4](step4)
- [Step 5](step5)
- [Step 6](step6)

### Prerequisites

TrueBlocks is built from source and, therefore, you'll need a few build tools:

| Operating System | Command                                                                                                           |
| ---------------- | ----------------------------------------------------------------------------------------------------------------- |
| **Linux:**       | `sudo apt install build-essential git cmake ninja-build python3 python3-dev libcurl4-openssl-dev clang-format jq` |
| **Mac:**         | `brew install cmake ninja git clang-format jq`                                                                    |

Check that things are working and install anything that's missing.

Pay particular attention to the versions of the tools (especially golang). The build won't work if the versions are too old.

| Tool   | check version?    | Download                                            | Version   |
| ------ | ----------------- | --------------------------------------------------- | --------- |
| jq     | `jq --version`    | [download](https://stedolan.github.io/jq/download/) | >= 1.6    |
| git    | `git version`     | [download](https://git-scm.com/downloads)           | >= 2.17.1 |
| cmake  | `cmake --version` | [download](https://cmake.org/install/)              | >= 3.20.1 |
| golang | `go version`      | [download](https://golang.org/doc/install)          | >= 1.12.1 |

### Building TrueBlocks

Complete the following commands to download and build TrueBlocks:

```[bash]
git clone https://github.com/TrueBlocks/trueblocks-tutorials
cd trueblocks-tutorials
mkdir -p build && cd build
cmake ../src
make -j 4
```

### To Test the Build

```[bash]
export PATH=../bin:$PATH
chifra version
chifra status
```

### Save your PATH

It makes sense to save the change to your PATH so each time you log in to a shell, you don't have to repeat the above `export`. We leave that as an exercise for you.
