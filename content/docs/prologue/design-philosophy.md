---
title: "Design philosophy"
description: "The philosophy behind the technical design of TrueBlocks"
lead: "A core set of values guides every aspect of TrueBlocks' technical design."
date: 2021-10-04T10:03:01-03:00
lastmod:
  - :git
  - lastmod
  - date
  - publishDate
draft: true
images: []
menu: 
  docs:
    parent: prologue
weight: 999
toc: true
---

No application can do all things. All design decisions involve tradeoffs.
TrueBlocks tries to make trade off _consciously_, so that we always
make the application best serve our core values.

These core values underlie every single commit made to the TrueBlocks codebase.

## Maximally important

These values are _imperative_. They are trueblocks

|value|what this value means to TrueBlocks|ranking|
|-----|-----------------------------------|-------|
|Decentralization|Very end users have no reliance on anyone other than themselves|1|
|Performance|Fast on small machines|2|
|Minimal storage|Small disc footprint on small machines|2|
Reproducability|Supports decentralization|3|


## Ranking of other values

|very important||||
|-|-----|-----------------------------------|-------|
||value|what this value means to TrueBlocks|ranking|
||Transparency|Every person has permissionless access to all the data they want|20|
||Integrity|Related to Rigor -- preserves the 'golden' nature of consented to (i.e. hashed) data|25|
||Rigor|Related to Integrity -- preserves the 'golden' nature of consented to (i.e. hashed) data|25|
||Stability|It should run forever with zero downtime|30|

|Important||||
|-|-----|-----------------------------------|-------|
||value|what this value means to TrueBlocks|ranking|
||Robustness|Works forever without needing to be futzed with|40|
||Approachability|Easy to understand how it works, easy to understand how to get started|50|
||Simplicity|Related to Approachability|60|
||Extensibility|Others should be able to add to it|70|
||Maintainability|Would like it to require no maintainance|80|
||Debuggability|Internally yes, but not a big concern as this will happen naturally anyway|90|

## Not a priorty

|value|what this value means to TrueBlocks|ranking|
|-----|-----------------------------------|-------|
|Compatibility|Depends on programming language, so not a concern|700|
|Composability|Not really a concern|700|
|Expressiveness|Not a concern|700|
|Interoperability|Production of the index needs to create something that is usful outside of TrueBlocks|700|
|Measurability|For internal use only, so less of a concern|700|
|Portability|Depends on programming language, so not a concern|700|
|Safty|Not really. Consented to data is safe. Reproducable consented to data is reproducably safe. User needs to learn to serve themselves|700|
|Security|Not really. Out of our code's perview other than basic software security. We hold no 'special' data, as our data is the consented to data|700|
|Thoroughness|It should do one thing perfectly -- reconciliations|700||
|Availability|This is dependant on the end user's setup, so not a big concern|900|

<div class="row"><div class="col-md-12"><div class="panel panel-success"><div class="panel-heading "><h3 class="panel-title">HTML Table Preview</h3></div>
<table border=1 class="table table-striped table-bordered table-hover">
<thead><tr><th title="Field #1">Matter Immensly</th>
<th title="Field #2">FIELD2</th>
<th title="Field #3">FIELD3</th>
<th title="Field #4">FIELD4</th>
</tr></thead>
<tbody><tr><td> </td>
<td>Decentralization (new)</td>
<td align="right">1</td>
<td>Very end users have no reliance on anyone other than themselves</td>
</tr>
<tr><td> </td>
<td>Performance</td>
<td align="right">2</td>
<td>Fast on small machines</td>
</tr>
<tr><td> </td>
<td>Hard Drive Space (new)</td>
<td align="right">2</td>
<td>Small disc footprint on small machines</td>
</tr>
<tr><td> </td>
<td>Reproducability (new)</td>
<td align="right">3</td>
<td>Supports decentralization</td>
</tr>
<tr><td> </td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td>Matter Most</td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td> </td>
<td>Transparency</td>
<td align="right">20</td>
<td>Every person has permissionless access to all the data they want</td>
</tr>
<tr><td> </td>
<td>Integrity</td>
<td align="right">25</td>
<td>Related to Rigor -- preserves the &#39;golden&#39; nature of consented to (i.e. hashed) data</td>
</tr>
<tr><td> </td>
<td>Rigor</td>
<td align="right">25</td>
<td>Related to Integrity -- preserves the &#39;golden&#39; nature of consented to (i.e. hashed) data</td>
</tr>
<tr><td> </td>
<td>Stability</td>
<td align="right">30</td>
<td>It should run forever with zero downtime</td>
</tr>
<tr><td> </td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td>Matter a Lot</td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td> </td>
<td>Robustness</td>
<td align="right">40</td>
<td>Works forever without needing to be futzed with</td>
</tr>
<tr><td> </td>
<td>Approachability</td>
<td align="right">50</td>
<td>Easy to understand how it works, easy to understand how to get started</td>
</tr>
<tr><td> </td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td>Matter</td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td> </td>
<td>Simplicity</td>
<td align="right">60</td>
<td>Related to Approachability</td>
</tr>
<tr><td> </td>
<td>Extensibility</td>
<td align="right">70</td>
<td>Others should be able to add to it</td>
</tr>
<tr><td> </td>
<td>Maintainability</td>
<td align="right">80</td>
<td>Would like it to require no maintainance</td>
</tr>
<tr><td> </td>
<td>Debuggability</td>
<td align="right">90</td>
<td>Internally yes, but not a big concern as this will happen naturally anyway</td>
</tr>
<tr><td> </td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td>Matter Less</td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td> </td>
<td>Compatibility</td>
<td align="right">700</td>
<td>Depends on programming language, so not a concern</td>
</tr>
<tr><td> </td>
<td>Composability</td>
<td align="right">700</td>
<td>Not really a concern</td>
</tr>
<tr><td> </td>
<td>Expressiveness</td>
<td align="right">700</td>
<td>Not a concern</td>
</tr>
<tr><td> </td>
<td>Interoperability</td>
<td align="right">700</td>
<td>Production of the index needs to create something that is usful outside of TrueBlocks</td>
</tr>
<tr><td> </td>
<td>Measurability</td>
<td align="right">700</td>
<td>For internal use only, so less of a concern</td>
</tr>
<tr><td> </td>
<td>Portability</td>
<td align="right">700</td>
<td>Depends on programming language, so not a concern</td>
</tr>
<tr><td> </td>
<td>Safty</td>
<td align="right">700</td>
<td>Not really. Consented to data is safe. Reproducable consented to data is reproducably safe. User needs to learn to serve themselves</td>
</tr>
<tr><td> </td>
<td>Security</td>
<td align="right">700</td>
<td>Not really. Out of our code&#39;s perview other than basic software security. We hold no &#39;special&#39; data, as our data is the consented to data</td>
</tr>
<tr><td> </td>
<td>Thoroughness</td>
<td align="right">700</td>
<td>It should do one thing perfectly -- reconciliations</td>
</tr>
<tr><td> </td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td>Don&#39;t Matter</td>
<td> </td>
<td align="right"></td>
<td> </td>
</tr>
<tr><td> </td>
<td>Availability</td>
<td align="right">900</td>
<td>This is dependant on the end user&#39;s setup, so not a big concern</td>
</tr>
<tr><td> </td>
<td>Operability</td>
<td align="right">1000</td>
<td>Not sure what this means</td>
</tr>
<tr><td> </td>
<td>Resiliency</td>
<td align="right">1000</td>
<td>Not sure what this means</td>
</tr>
<tr><td> </td>
<td>Velocity</td>
<td align="right">1000</td>
<td>Not sure what this means</td>
</tr>
</tbody></table>
</div></div></div>

## Mantras for decentralized data
We keep an ongoing list of mantras that, if repeated endlessly, will eventually sink in:

* All the data, for all the people, all the time, but no data if the user doesn’t want it
* Use only consented-to data…
    * If you can’t do that, use only data derived directly from consented-to data
    * If you can’t do that, find a way to force the data provider to prove their data
* The paradigm has shifted, embrace it - the server is now called localhost
* Break yourself out of the browser. There’s a big wide desktop out there
* It’s easier to scale up than to scale down - decentralize first
* Most users care only about themselves and maybe a few smart contracts
* Some users, but not all, care about everything
* Everyone needs to do accounting and pay taxes
* The node can, and should be, be improved

