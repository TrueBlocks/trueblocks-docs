---
title: "TrueBlocks in Berlin - 2023"
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

### Prior to attending the session

To save time for everyone, please complete the [Prerequisites](#prerequisites) before you come.

### What we hope to accomplish

We hope to show just how true this statement is: "Accessing Ethereum data from a locally running Ethereum node is orders of magnitude better than accessing it remotely."

People don't understand what this actually means. Come learn. Hint: it's not just about speed.

### Tasks

- [Prerequisites](#prerequisites)
- [Building TrueBlocks](#building-trueblocks)
- [Step 1 - Getting Started](step1)
- [Step 2 - Getting Data?](step2)
- [Step 3 - Getting Details](step3)
- [Step 4 - Getting Serious](step4)

### Prerequisites

TrueBlocks is built from source and, therefore, you'll need a few build tools. Run the following commands depending on your operating system.

| Operating System | Command                                                                                                           |
| ---------------- | ----------------------------------------------------------------------------------------------------------------- |
| **Linux:**       | `sudo apt install build-essential git cmake ninja-build python3 python3-dev libcurl4-openssl-dev clang-format jq` |
| **Mac:**         | `brew install cmake ninja git clang-format jq`                                                                    |

Check that things are working and install anything that's missing. Pay particular attention to the versions of the tools (especially golang). The build won't work if the versions are too old.

#### Required tools

| Tool   | run this...       | ...if you get this, you're done... | ...if not, download it                     |
| ------ | ----------------- | ---------------------------------- | ------------------------------------------ |
| git    | `git version`     | >= 2.17.1                          | [download](https://git-scm.com/downloads)  |
| cmake  | `cmake --version` | >= 3.20.1                          | [download](https://cmake.org/install/)     |
| golang | `go version`      | >= 1.12.1                          | [download](https://golang.org/doc/install) |

#### Optional tool

This tool is optional but is sometimes useful for making the data easier to see.

| Tool | run this...    | ...if you get this, you're done... | ...if it doesn't work, download it                  |
| ---- | -------------- | ---------------------------------- | --------------------------------------------------- |
| jq   | `jq --version` | >= 1.6                             | [download](https://stedolan.github.io/jq/download/) |

### Building TrueBlocks

The following commands will download and build TrueBlocks. This will take a moment. In the meantime....

```[bash]
git clone https://github.com/TrueBlocks/trueblocks-tutorials
cd trueblocks-tutorials
mkdir -p build && cd build
cmake ../src
make -j 4
```

### To test the build

Once TrueBlocks is built, run these commands to test your installation.

```[bash]
export PATH=../bin:$PATH
which chifra # it should say ../bin/chifra
chifra version
chifra status

```

Let's proceed with the tutorial with [Step 1 - Getting Started](/tutorials/step1).

### Save your PATH

It makes sense to save the change to your PATH so each time you log in to a shell, you don't have to repeat the above `export`. We leave that as an exercise for you.