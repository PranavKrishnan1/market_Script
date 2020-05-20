
##source("D:/market_Script/market.R")


ui <- fluidPage(
  
  
  titlePanel("Welcome to my app"),
  sidebarLayout(
    sidebarPanel(
      
      textInput("key","enter your key here")
      
    ),
    
    mainPanel(
      
      verbatimTextOutput("Here's your dataset"),
      tableOutput("view")
    )
  )
)

server <- function(input, output) {
  
  source("D:/market_Script/market.R")
  t = market()

    output$view <- renderTable({
     t
    })
}

shinyApp(ui, server)

