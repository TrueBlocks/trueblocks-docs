#!/usr/bin/env bash

## Runs from `trueblocks-core/docs/readmes`
## As we get better we can make this more robust, or rewrite it as something that makes more sense

SOURCE=https://raw.githubusercontent.com/TrueBlocks/trueblocks-core/develop/docs
READMES=$SOURCE/readmes
INTROS=$READMES/intros
CONTENT=content/docs/chifra
#DATE=`date "+%FT%T"`
DATE="2021-05-08T01:35:20"

#----------------------------------
ACCOUNTS=$CONTENT/accounts.md
cat << _EOF_ > $ACCOUNTS &&
---
title: "Accounts"
description: ""
lead: ""
date: $DATE
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
weight: 10
toc: true
---
_EOF_

echo "Building accounts page..."
curl -s $INTROS/accounts.md >> $ACCOUNTS && \
curl -s $READMES/apps/list.md >> $ACCOUNTS && \
curl -s $READMES/apps/acctExport/README.md >> $ACCOUNTS && \
curl -s $READMES/apps/monitors.md >> $ACCOUNTS && \
curl -s $READMES/tools/ethNames/README.md >> $ACCOUNTS && \
curl -s $READMES/tools/grabABI/README.md >> $ACCOUNTS

#----------------------------------
DATA=$CONTENT/chaindata.md
cat << _EOF_ > $DATA &&
---
title: "Chain Data"
description: ""
lead: ""
date: $DATE
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
weight: 20
toc: true
---
_EOF_

echo "Building chain data page..."
curl -s $INTROS/chaindata.md >> $DATA && \
curl -s $READMES/tools/getBlocks/README.md >> $DATA && \
curl -s $READMES/tools/getTrans/README.md >> $DATA && \
curl -s $READMES/tools/getReceipts/README.md >> $DATA && \
curl -s $READMES/tools/getLogs/README.md >> $DATA && \
curl -s $READMES/tools/getTraces/README.md >> $DATA && \
curl -s $READMES/tools/whenBlock/README.md >> $DATA

#----------------------------------
STATE=$CONTENT/chainstate.md
cat << _EOF_ > $STATE &&
---
title: "Chain State"
description: ""
lead: ""
date: $DATE
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
_EOF_

echo "Building chain state page..."
curl -s $INTROS/chainstate.md >> $STATE && \
curl -s $READMES/tools/getState/README.md >> $STATE && \
curl -s $READMES/tools/getTokens/README.md >> $STATE

#----------------------------------
ADMIN=$CONTENT/admin.md
cat << _EOF_ > $ADMIN &&
---
title: "Admin"
description: ""
lead: ""
date: $DATE
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
weight: 40
toc: true
---
_EOF_

echo "Building admin page..."
curl -s $INTROS/admin.md >> $ADMIN && \
curl -s $READMES/apps/cacheStatus/README.md >> $ADMIN && \
curl -s $READMES/apps/serve.md >> $ADMIN && \
curl -s $READMES/apps/blockScrape/README.md >> $ADMIN && \
curl -s $READMES/apps/init.md >> $ADMIN && \
curl -s $READMES/apps/pinMan/README.md >> $ADMIN

#----------------------------------
OTHER=$CONTENT/other.md
cat << _EOF_ > $OTHER &&
---
title: "Other"
description: ""
lead: ""
date: $DATE
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
weight: 50
toc: true
---
_EOF_

echo "Building other page..."
curl -s $INTROS/other.md >> $OTHER && \
curl -s $READMES/tools/getQuotes/README.md >> $OTHER && \
curl -s $READMES/tools/explore.md >> $OTHER && \
curl -s $READMES/tools/ethslurp/README.md >> $OTHER

#----------------------------------
APIHELP=$CONTENT/../help/api.html
echo "Building api help file"
curl -s $SOURCE/api.html >$APIHELP

echo "Pages built. To see what's changed, run  git diff content/docs/chifra"
