---
title: "Step 4 - Getting Serious"
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

### Step 4 - Getting Serious



```[bash]
38  chifra
   39  which chifra
   46  chifra
   47  chifra names -c
   49  chifra names -c
   50  chifra init
   52  chifra init
   53  chifra init
   54  chifra init
   55  chifra init
   56  chifra names -c
   57  chifra export 0x054993ab0f2b1acc0fdc65405ee203b4271bebe6
   58  chifra list  0x054993ab0f2b1acc0fdc65405ee203b4271bebe6
   59  chifra export 0x054993ab0f2b1acc0fdc65405ee203b4271bebe6 --fmt json --articulate --accounting
   60  chifra export 0x054993ab0f2b1acc0fdc65405ee203b4271bebe6 --fmt json --articulate --accounting
   66  chifra
   67  chifra status --terse
   68  chifra init
   69  chifra init
   70  chifra blocks 0-100000:10
   71  chifra blocks 0-100000:10
   72  chifra status --terse
   73  chifra status
   74  chifra status --terse
   77  chifra status --terse
   80  chifra status --terse
   82  chifra status --terse
   85  chifra status --terse
  103  chifra init
  105  chifra init
  106  chifra blocks 12
  107  chifra when 13071849
  108  chifra when 2021-08-22
  109  chifra when 2021-08-22T23:59:59
  110  chifra blocks 13071749-13078270
  111  chifra blocks 13071749
  113  chifra blocks 13071749-13078270
  115  chifra blocks 13071749-13078270
  116  echo "chifra blocks 13071749-13078270" /Users/jrush/Public/file.txt
  117  echo "chifra blocks 13071749-13078270" >/Users/jrush/Public/file.txt
  118  chifra serve
  179  chifra
  180  chifra status --terse
  183  chifra status --terse
  192  ls -l $(which chifra)
  195  ls -l $(which chifra)
  196  chifra
  197  chifra 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  198  chifra state 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  199  chifra state 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  200  chifra state 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  201  chifra state 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  203  chifra state 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  204  chifra
  255  which chifra
  256  chifra
  262  chifra
  267  chifra
  268  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  269  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  272  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  274  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  278  chifra names GitCoin Freidns
  279  chifra names GitCoin Freind
  280  chifra names GitCoin
  281  chifra names GitCoin | grep Frie
  282  chifra names GitCoin | grep Freinds
  283  chifra names GitCoin | grep Top
  284  chifra names GitCoin | grep "Top Ten"
  285  chifra names GitCoin | grep "Top 10"
  293  chifra explore 0xc766e184d566cc53497fa2b0e1c4ab143b1caa2f
  294  chifra explore --google 0xc766e184d566cc53497fa2b0e1c4ab143b1caa2f
  295  chifra list 0xc766e184d566cc53497fa2b0e1c4ab143b1caa2f
  297  chifra names 0x34cfac646f301356faa8b21e94227e3583fe3f5f
  298  chifra names 0x34 | grep -i git
  299  chifra names 0x34 | grep -i 0x34d945d53e7856fd9a47f68474c469e04b299b37
  300  chifra names 0x34 | grep -i 0x34d945d53e7856fd9a47f68474c469e04b299b37
  301  chifra names 0x34 | grep -i 0x34cfac646f301356faa8b21e94227e3583fe3f5f
  306  chifra names 0x69EB8B0353A5DfA8414966b0207769aEfbf0627D
  307  chifra list 0x69eb8b0353a5dfa8414966b0207769aefbf0627d
  308  chifra list 0x69eb8b0353a5dfa8414966b0207769aefbf0627d --count
  309  chifra list 0x69eb8b0353a5dfa8414966b0207769aefbf0627d | wc
  310  chifra list 0x69eb8b0353a5dfa8414966b0207769aefbf0627d | sort | uniq
  311  chifra list 0x69eb8b0353a5dfa8414966b0207769aefbf0627d | sort | uniq | wc
  312  chifra list --clean
  313  chifra export --clean
  314  chifra list 0xC577EF224f94f6E2c2491Bb4930e5e67b93ff10C
  315  chifra
  316  chifra list
  317  chifra
  318  chifra list 0x054993ab0f2b1acc0fdc65405ee203b4271bebe6
  319  chifra list 0x054993ab0f2b1acc0fdc65405ee203b4271bebe6
  322  chifra serve
  323  chifra monitors
  324  chifra monitors --clean
  341  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  342  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  343  chifra status --terse
  348  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  350  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  351  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  352  chifra init
  353  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  354  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  355  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  356  chifra list 0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --count
  357  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96
  363  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --help
  364  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --h-fmt json
  365  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json
  366  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt csv
  367  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0.000000020000000000
  368  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt csv
  369  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96
  370  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json
  371  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96
  372  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | jq
  373  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | tee file
  375  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96 | sed 's/0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96/MERIAM IS COOL/'
  376  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96
  377  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json
  378  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96
  379  chifra export  0xe00AbC6686eE8fA5C45161A5FA75fB99a1026B96 --fmt json | grep 0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96 | sed 's/0xe00abc6686ee8fa5c45161a5fa75fb99a1026b96/MERIAM IS COOL/'
  380  chifra
  381  chifra export
  382  chifra explore --google 0x34BC437c037c6a266C761ae117fD99dD9619E03C
  383  chifra names 0x34BC437c037c6a266C761ae117fD99dD9619E03C
  388  chifra names 0x34BC437c037c6a266C761ae117fD99dD9619E03C
  389  chifra export  0x34BC437c037c6a266C761ae117fD99dD9619E03C --count
  390  chifra export  0x34BC437c037c6a266C761ae117fD99dD9619E03C |more
  391  chifra export  0x34BC437c037c6a266C761ae117fD99dD9619E03C --fmt json|jq|more
  392  chifra export  0x34BC437c037c6a266C761ae117fD99dD9619E03C --fmt json|jq|more
  393  chifra export  0x34BC437c037c6a266C761ae117fD99dD9619E03C --fmt json --articulate |jq|more
  394  chifra export  0x34BC437c037c6a266C761ae117fD99dD9619E03C --fmt json --articulate --logs |jq|more
  428  chifra list
  443  chifra --version
  444  chifra names
  447  chifra names
  489  chifra version
  493  chifra version
  494  ../bin/chifra
  498  chifra version
  503  chifra version
  504  chifra version
  505  chifra status
  506  chifra status
  508  chifra status
  509  chifra chunks blooms
  510  chifra scrape
  511  chifra init
  513  chifra list trueblocks.eth
  514  chifra export trueblocks.eth
  515  chifra export trueblocks.eth --fmt json
  516  chifra export trueblocks.eth --fmt json --logs
  517  chifra export trueblocks.eth --fmt json --logs --articulate
  518  chifra init
  519  chifra chunks blooms
  520  time chifra blocks 1000
  521  time chifra blocks 1-2000
  522  time chifra blocks 1-20
  523  time chifra blocks 1-2000
  524  history | grep chifra
  525  history | grep chifra  >commands.txtt
```


---
[<< Prev](/tutorials/step3) | [Home](/tutorials/)
