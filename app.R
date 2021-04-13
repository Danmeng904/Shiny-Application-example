library(shiny)
library(ggplot2)

#import and define the data we use
costData <- read.csv("insurance.csv")

# Define UI for app ----
ui <- fluidPage(
  # App title ----
  titlePanel("InsuranceCost"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      helpText("Please select the variable to see the visualization 
               between it and the cost:"),
      
      
      selectInput("var1", h4("Choose a variable"), 
                  choices = c("Age" = 'age', 
                              "BMI" = 'bmi'),selected = "age"),
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      h3(textOutput("caption")),
      plotOutput("scatterplot")
    )
  )
)

# Define server ----
server <- function(input, output) {
  
  formulaText <- reactive({
    paste(input$var1, "and cost")
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$scatterplot <- renderPlot({
    ggplot(data = costData,aes(input$var1,charges,color = sex))+
      geom_point() +
      geom_smooth(method = 'lm')
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)