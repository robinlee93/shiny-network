library(shiny)
library(igraph)
# ui.R
layouts <- grep("^layout\\.", ls("package:igraph"), value=TRUE) 
# Remove layouts that do not apply to our graph.
layouts <- layouts[!grepl("bipartite|merge|norm|sugiyama", layouts)]


fluidPage(
  
  titlePanel("Layout Tester"),
  
  sidebarLayout(
    sidebarPanel( 
      p("Use this tool to upload your netowork and play around with different layouts. You'll see a plot of the network and some basic statistics about it."),
      fileInput("linksfile", "Upload an edge list"),
      selectInput("l", "Choose a layout", layouts),
      checkboxInput("size", label = "Size of nodes depends on centrality", value = FALSE),
      submitButton("Graph with changes")
    ),
    mainPanel(
      
      
      plotOutput(outputId = "networkmap"),
      textOutput(outputId = "test"),
      tableOutput(outputId = "table"),
      tableOutput(outputId = "degree"),
      tableOutput(outputId = "betweeness"),
      tableOutput(outputId = "closeness"),
      tableOutput(outputId = "degree_distribution")
    )
  )
)