### <b>Network Viewer</b>
<hr>

> Network Viewer is a simple online tool to make a quick view of a network and view the paths over the network powered R Shiny.

#### Dependencies
<hr>

[![R](https://img.shields.io/badge/R-3.5.0-blue.svg?longCache=true&style=plastic)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1.1.0-blue.svg?longCache=true&style=plastic)](https://shiny.rstudio.com/)
[![networkD3](https://img.shields.io/badge/networkD3-0.4-blue.svg?longCache=true&style=plastic)](https://www.rdocumentation.org/packages/networkD3)
[![visNetwork](https://img.shields.io/badge/visNetwork-2.0.4-blue.svg?longCache=true&style=plastic)](https://datastorm-open.github.io/visNetwork/shiny.html)
[![igraph](https://img.shields.io/badge/igraph-1.2.1-blue.svg?longCache=true&style=plastic)](http://igraph.org/r/)

#### Release Notes
<hr>

###### v1.0

- Network viewer initiated with three types of plots (iGraph, D3, visNetwork).
- Network paths computations added to show all links.
- Paths table available as data frame can be downloaded as `txt` and `csv`.
- Note tab added.

#### <b>DATA REQUIREMENTS</b>
<hr>

NV (Network Viewer) needs Edge list data to construct the network view. 
Your data should be in `comma seperated values` file like shown below,

```text
START,DESTINATION,ROUTE
MADURAI,CHENNAI,NH38
MADURAI,COIMBATORE,NH44
MADURAI,TRIVANDRUM,NH744
COIMBATORE,CHENNAI,NH544
```


#### <b>Instruction</b>
<hr>

If you select `AEND` and `ZEND` same column, It will show you an error.

> Error: subscript out of bounds

<b><font color="red">So watch your Inputs!</font></b>


#### **Online Tool**

<p align="center">
<kbd>
<img src="https://bhanuchander210.github.io/master_navs/myapps/images/networkviewer.gif" width="400" height=auto align="center" />
</kbd>
</p>

R shiny Web Tool : **[link](https://bhanuchander.shinyapps.io/networkviewer/)**


#### <b> Suggest</b>
<hr>

> For suggestions Ping me [here](https://bhanuchander210.github.io)