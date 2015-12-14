library(shiny)
library(igraph)
# ui.R
layouts <- grep("^layout\\.", ls("package:igraph"), value=TRUE) 
# Remove layouts that do not apply to our graph.
layouts <- layouts[!grepl("bipartite|merge|norm|sugiyama", layouts)]


fluidPage(
  
  
  fileInput("linksfile", "Upload an edge list"),
 
  selectInput("l", "Choose a layout", layouts),
  submitButton("Graph with changes"),
  
#  "size"
#  "direct" T or F
  
  plotOutput(outputId = "networkmap"),
  textOutput(outputId = "test"),
  tableOutput(outputId = "table")
)