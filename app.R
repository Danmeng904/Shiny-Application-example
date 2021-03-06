library(shiny)
library(ggplot2)
library(tidyverse)
library(devtools)

#import and define the data we use
costData <- read.csv("https://raw.githubusercontent.com/Danmeng904/Shiny-Application-example/main/data/insurance.csv",
                     header = TRUE)
source_url("https://raw.githubusercontent.com/Danmeng904/Shiny-Application-example/main/LRsummaryFunction.R")


# Define UI for app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("InsuranceCost"),
  
  sidebarLayout(
    
    sidebarPanel(
      tabsetPanel(id = "tabset",
                  tabPanel("Numerical",
                           selectInput("var1", h5("Choose a numerical variable"), 
                                       choices = c("Age" = 'age', 
                                                   "BMI" = 'bmi'),selected = "age"),
                  ),
                  tabPanel("Categorical",
                           selectInput("var2", h5("Choose a categorical variable"), 
                                       choices = c("Number of children" = 'children', 
                                                   "Smoke or not" = 'smoker',
                                                   "Region" = 'region'),selected = "children"),
                  )
                  
      ),
      
      actionButton("go", "Plot"),
      
      actionButton("lr","Linear Regression Summary")
      
    ),
    
    mainPanel(
      plotOutput("plot"),
      
      verbatimTextOutput("lrsummary")
    )
    
  )
)



# Define server ----
server <- function(input, output,session) {
  
  global <- reactiveValues(refresh = FALSE)
  
  # the plot shown when choosing certain variable
  v <- reactiveValues(doPlot = FALSE)
  
  observeEvent(input$go, {
    v$doPlot <- input$go
  })
  
  observeEvent(input$tabset, {
    v$doPlot <- FALSE
  })
  
  # show linear regression summary
  lmreaction <- eventReactive(input$lr,{
    lroutput(costData)
  })
  
  output$lrsummary <- renderPrint({
    lmreaction()
  })
  
  output$plot <- renderPlot({
    if (v$doPlot == FALSE) return()
    
    isolate({
      data <- if (input$tabset == "Numerical"){
        ggplot(costData,aes_(as.name(input$var1),quote(charges),color = quote(sex)))+
          geom_point()+
          geom_smooth(method = 'lm')
      } else {ggplot(costData,aes_(as.name(input$var2),quote(charges))) +
          geom_boxplot()+facet_wrap(~sex)}
      
      plot(data)
    })
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
