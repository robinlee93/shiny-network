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
    deg <- degree(g, mode="all")
    if (input$size==TRUE) V(g)$size <- deg*6
    plot(g, layout=get(input$l))  
  })
  output$table <- renderTable({
    Infilelinks <- input$linksfile
    if (is.null(Infilelinks))
      return(NULL)
    links <- read_csv(Infilelinks$datapath)
    links
    
  })
  output$degree <- renderTable({
    Infilelinks <- input$linksfile
    if (is.null(Infilelinks))
      return(NULL)
    links <- read_csv(Infilelinks$datapath)
    g <- graph.data.frame(links,  directed = F)
    as.data.frame(degree(g))
  })
  
  output$betweeness <- renderTable({
    Infilelinks <- input$linksfile
    if (is.null(Infilelinks))
      return(NULL)
    links <- read_csv(Infilelinks$datapath)
    g <- graph.data.frame(links,  directed = F)
    as.data.frame(betweenness(g))
  })
  
  output$closeness <- renderTable({
    Infilelinks <- input$linksfile
    if (is.null(Infilelinks))
      return(NULL)
    links <- read_csv(Infilelinks$datapath)
    g <- graph.data.frame(links,  directed = F)
    as.data.frame(closeness(g))
  })
  
  output$degree_distribution <- renderTable({
    Infilelinks <- input$linksfile
    if (is.null(Infilelinks))
      return(NULL)
    links <- read_csv(Infilelinks$datapath)
    g <- graph.data.frame(links,  directed = F)
    as.data.frame(degree.distribution(g))
  })
}