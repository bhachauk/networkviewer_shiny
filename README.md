### <b>NETWORK VIEWER</b>

> Network Viewer is a simple online tool to make a quick view of a network and view the paths over the network powered R Shiny.

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

<b> So watch your Inputs </b>

#### <b> PACKAGES </b>

- [igraph](http://kateto.net/networks-r-igraph)
- [networkD3](https://christophergandrud.github.io/networkD3/)
- [visNetwork](https://datastorm-open.github.io/visNetwork/)


#### <b> SUGGESTION BOX </b>

> For suggestions Ping me [here](https://bhanuchander210.github.io)