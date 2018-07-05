### <b>NETWORK VIEWER</b>

> Network Viewer is a simple online tool to make a quick view of a network and view the paths over the network powered R Shiny.

#### Release Notes

###### v1.0

- Network viewer initiated with three types of plots (iGraph, D3, visNetwork).
- Network paths computations added to show all links.
- Paths table available as data frame can be downloaded as `txt` and `csv`.
- Note tab added.

#### <b>DATA REQUIREMENTS</b>

> NV needs Edge list data to construct the network view. Your data should be in `comma seperated values` file like shown below,

```text
START,DESTINATION,ROUTE
MADURAI,CHENNAI,NH38
MADURAI,COIMBATORE,NH44
MADURAI,TRIVANDRUM,NH744
COIMBATORE,CHENNAI,NH544
```


#### <b>INSTRUCTION</b>

If you select AEND and ZEND same column, It will show you an error.

> Error: subscript out of bounds

<b><font color="red">So watch your Inputs!</font></b>


#### <b> SUGGESTION BOX </b>

> For suggestions Ping me [here](https://bhanuchander210.github.io)