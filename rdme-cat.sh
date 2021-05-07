#!/bin/sh

ACCOUNTS=accounts.md
ADMIN=admin.md
DATA=data.md
OTHER=other.md
STATE=state.md

cat << _EOF_ > $ACCOUNTS &&
---
title: "Accounts"
description: ""
lead: ""
date: 2021-04-29T09:18:42-03:00
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
cat intros/accounts.md >> $ACCOUNTS &&\
cat apps/acctExport/README.md >> $ACCOUNTS &&\
cat tools/ethNames/README.md >> $ACCOUNTS &&\
cat tools/grabABI/README.md >> $ACCOUNTS &&\
echo "${ACCOUNTS} built" || echo "${ACCOUNTS} not built"

cat << _EOF_ > $DATA &&
---
title: "Blockchain Data"
description: ""
lead: ""
date: 2021-04-29T09:18:11-03:00
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
cat intros/blockchaindata.md >> $DATA &&\
cat tools/getBlocks/README.md >> $DATA && \
cat tools/getTrans/README.md >> $DATA && \
cat tools/getReceipts/README.md >> $DATA &&\
cat tools/getLogs/README.md >> $DATA &&\
cat tools/getTraces/README.md >> $DATA &&\
cat tools/whenBlock/README.md >> $DATA &&\
echo "${DATA} built" || echo "${DATA} not built"


cat << _EOF_ > $STATE &&\

---
title: "State"
description: ""
lead: ""
date: 2021-04-29T09:18:48-03:00
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
cat intros/state.md >> $STATE && \
cat tools/getTraces/README.md >> $STATE &&\
cat tools/getTokens/README.md >> $STATE &&\
echo "${STATE} built" || echo "${STATE} not built"

cat << _EOF_ > $ADMIN &&
---
title: "Admin"
description: ""
lead: ""
date: 2021-04-29T09:18:42-03:00
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
cat intros/admin.md >> $ADMIN &&\
cat apps/pinMan/README.md >> $ADMIN &&\
cat apps/blockScrape/README.md >> $ADMIN &&\
cat apps/cacheStatus/README.md >> $ADMIN &&\
echo "${ADMIN} built" || echo "${ADMIN} not built"

cat << _EOF_ > $OTHER &&
---
title: "Other"
description: ""
lead: ""
date: 2021-04-29T09:18:48-03:00
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
cat tools/ethslurp/README.md >> $OTHER && \
cat tools/getQuotes/README.md >> $OTHER && \
echo "${OTHER} built" || echo "${OTHER} not built"

