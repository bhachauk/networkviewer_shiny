library(networkD3)
library(visNetwork)
library(igraph,warn.conflicts = FALSE)
library(shiny)

ui <- fluidPage(
    h1("Network Viewer"),
    sidebarPanel(
          fileInput("file1", "CHOOSE CSV FILE",
                       accept = c(
                         "text/csv",
                         "text/comma-separated-values,text/plain",
                         ".csv"),placeholder = "No file selected"
             ),
          uiOutput('acol'),
          uiOutput('zcol'),
          uiOutput('acollabel'),
          uiOutput('zcollabel'),
          uiOutput('linklabel'),
          width=2
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Table View",
                 tableOutput("outdata")
        ),
        tabPanel("Paths",
                 verbatimTextOutput("igraphpaths")
        ),
        tabPanel("Plot IGraph",
                 plotOutput("igraphplot")
        ),
        tabPanel("Plot D3",
                 simpleNetworkOutput("d3plot")
        ),
        tabPanel("Plot VisNetwork",
                 visNetworkOutput ("visPlot")
                 )
    ),
    width = 10
    ),
    absolutePanel(
      img(src='square_icon.png', align = "right-top")
      , id = "input_date_control", class = "panel panel-default", fixed = TRUE
      , draggable = FALSE, top = 'auto', left = 'auto', right = 0, bottom = 0
      , width = '5%', height = 'auto'
    )  
    
    )
  
  server <- function(input, output,session) {
    
    contents <- reactive({
      
      shiny::validate(
        need(input$file1, "Select a file!")
      )

      inFile <- input$file1
 
      if (is.null(inFile))
        return(NULL)
      
      read.csv(inFile$datapath, header =TRUE)
    })

      output$acol <- renderUI({
        conditionalPanel(
        condition = "contents() != NULL",

        selectInput('aend', 'NODE A', names(contents()) ,selected = NULL)
        )
    })

      output$acollabel <- renderUI({
        conditionalPanel(
        condition = "contents() != NULL",

        selectInput('aendlab', 'LABEL NODE A', setdiff(names(contents()),c(input$aend,input$zend)),selected = NULL)
        )
    })

    output$zcol <- renderUI({
        conditionalPanel(
        condition = "contents() != NULL",
        selectInput('zend', 'NODE Z', names(contents())[names(contents())!=input$aend] ,selected = NULL)
        )
    })


    output$zcollabel <- renderUI({
        conditionalPanel(
        condition = "contents() != NULL",


        selectInput('zendlabel', 'ZEnd_Column_Label', setdiff(names(contents()), c(input$aend,input$aendlab,input$zend)),selected = NULL)
        )
    })

     output$linklabel <- renderUI({
        conditionalPanel(
        condition = "contents() != NULL",

        selectInput('linklab', 'LINK LABEL', setdiff(names(contents()),c(input$aend,input$aendlab,input$zend,input$zendlabel)),selected = NULL)
        )
    })
     
     output$outdata <- renderTable({
       
       shiny::validate(
         need(input$file1, "Waiting for file!")
       )
       
       inFile <- input$file1
       
       if (is.null(inFile))
         return(NULL)
       df <- read.csv(inFile$datapath, header =TRUE)[ ,c(input$aend,input$zend)]
      })

     
     output$d3plot <- renderSimpleNetwork({
       
       shiny::validate(
         need(input$file1, "Waiting for file!")
       )
       
       inFile <- input$file1
       
       if (is.null(inFile))
         return(NULL)
       df <- read.csv(inFile$datapath, header =TRUE)[ ,c(input$aend,input$zend,input$linklab)]
       #networkData <- data.frame(src, target)
       simpleNetwork(df,Source = 1, Target = 2, height = 10, width = NULL,
                     linkDistance = 50, charge = -30, fontSize = 12, fontFamily = "serif",
                     linkColour = "#666", nodeColour = "#3182bd", opacity = 1, zoom = TRUE)
     })
     

     
     output$visPlot <- renderVisNetwork({
       
       shiny::validate(
         need(input$file1, "Waiting for file!")
       )
       
       inFile <- input$file1
       
       if (is.null(inFile))
         return(NULL)
       df <- read.csv(inFile$datapath, header =TRUE)
       

       ndfl<- (as.list(df[[input$aend]]))
       ndfl <-  append(ndfl,as.list(df[[input$zend]]))
       
       nodes <-  data.frame(
         id = unique(unlist(ndfl)),
         label=unique(unlist(ndfl))
         )
       
       edges <- data.frame(
         from = df[[input$aend]], 
         to = df[[input$zend]],
         arrows = c("to"),
         label =df[[input$linklab]]
          )

       
       # arrows
       arrows = c("to", "from", "middle", "middle;to")
       visNetwork(nodes, edges, 
                  height = "100%", width = "100%",
                  main = "")
     })
     
     output$igraphpaths <- renderText({
       
       shiny::validate(
         need(input$file1, "Waiting for file!")
       )
       
       inFile <- input$file1
       
       if (is.null(inFile))
         return(NULL)
       
       df <- read.csv(inFile$datapath, header =TRUE)[ ,c(input$aend,input$zend,input$linklab)]
       net <- graph_from_data_frame(d=df, vertices=NULL, directed=T)
       l <- unlist(lapply(V(net) , function(x) all_simple_paths(net, from=x)), recursive = F)
       paths <- lapply(1:length(l), function(x) as_ids(l[[x]]))
       
       pathdf <- read.csv(text="Nodes")
       
       #paste(eachpath, collapse='-->' )
       #paste( paths,sep='-->')
       Result <- ''
       for (each in paths)
       {
         temp<-paste(each,collapse = '-->')
         Result <- paste(Result,temp,'\n')
       }
       paste(Result)
     })
     
     output$igraphplot <- renderPlot({
       
       shiny::validate(
         need(input$file1, "Waiting for file!")
       )
       
       inFile <- input$file1
       
       if (is.null(inFile))
         return(NULL)
       
       dat <- read.csv(inFile$datapath, header =TRUE)[ ,c(input$aend,input$zend,input$linklab)]
        
       ig <- graph_from_data_frame(d=dat, vertices=NULL, directed=T)
        
       plot(ig, edge.arrow.size=.5, vertex.color="green", vertex.size=15, 
             
             vertex.frame.color="magenta", vertex.label.color="black", 
             
             vertex.label.cex=0.5, vertex.label.dist=2, edge.curved=0,zoom=TRUE) 
     })
     
  }
  
  shinyApp(ui, server)
