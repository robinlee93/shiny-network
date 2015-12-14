library(shiny)
library(igraph)
library(readr)
function(input, output) {
  
  output$networkmap <- renderPlot({
   Infilelinks <- input$linksfile
   if (is.null(Infilelinks))
     return(NULL)
   links <- read_csv(Infilelinks$datapath)

    
    g <- graph.data.frame(links,  directed = F)
    plot(g, layout=get(input$l))  
  })
  output$table <- renderTable({
    Infilelinks <- input$linksfile
    if (is.null(Infilelinks))
      return(NULL)
    links <- read_csv(Infilelinks$datapath)
    links
  })
}