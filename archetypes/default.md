---
title: "{{ replace .Name "-" " " | title }}"
description: ""
lead: ""
date: {{ .Date }}
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: true
images: []
menu: 
  "":
    parent: {{ .Dir }}
weight: 999
toc: true
---

