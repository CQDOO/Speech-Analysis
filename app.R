library(qdap)
library(shiny)
library(readr)

ui <- fluidPage(
  titlePanel("Uploading Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose text File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      tags$hr()
    ),
    mainPanel(
      tableOutput('contents')
    )
  )
)



server <- function(input, output) {
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    str(inFile)
    File <- read_lines(inFile$datapath)
    
    
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

