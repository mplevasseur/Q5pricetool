# Q5pricetool ui.R

library(shiny)
library(ggplot2)
library(plotly)

dataset <- read.csv(file="data/Q5rawdata.csv", header=TRUE)
#dataset <- Q5data

shinyUI(
fluidPage(
    sidebarPanel(
        plotOutput('Q5hist', height="300px"),
        
        h4("Step 1. Enter key features, predict a price"),
        helpText("Years 2010.0 - 2015.0 (decimal allowed), Miles 0 - 75000 (no commas)"),
        
        numericInput('miles', 'Odometer miles (0-50 is new)', 30000, min=0, 
                     max=75000, step=5000, width="100%"),
        numericInput('year', 'Year', 2012.0, min=2010, max=2015, 
                     step = 1, width= "100%"),
        selectInput('trim', 'Trim',
                    list("Premium", 
                        "PremiumPlus" , 
                         "Prestige"), selected="Premium"),
        selectInput('engine', 'Engine',
                    c("2.0 4-cylinder aka 'Engine A'"="A", 
                         "3.0 6-cylinder aka 'Engine B'" = "B", 
                         "3.0 6-cylinder Diesel or Hybrid, aka 'Engine C'" = "C"), selected="A"),
    
        submitButton('Predict'),
        h5("Predicted Price (US$) = good *list* price:"),
        verbatimTextOutput("prediction"),
        h5("Best expected purchase price:"),
        verbatimTextOutput("goodprice"),
        
        h4("Step 2. Explore listings with plots"),
        helpText("Choose what to plot on axes, by color, category splits"),
        
        selectInput('y', 'Y-axis variable', names(dataset)),
        selectInput('x', 'X-axis variable', names(dataset), names(dataset)[[2]]),
        selectInput('color', 'Denote additional variable by color (optional)', c('None', names(dataset))),
        selectInput('facet_row', 'Split Plot by Row Cateogry (optional)', c(None='.', names(dataset))),
        selectInput('facet_col', 'Split Plot by Column Category (optional)', c(None='.', names(dataset))),
        submitButton('Plot It!'),
        
        h4("Step 3. Find Good Buys below a fit line"),
        helpText("Fits a line to most plots. Push the Calculate first, then Graph button to see it appear."),
        actionButton('action', label = 'Calculate Line'),
        submitButton('Graph Line')),
    
    titlePanel("AudiQ5 Pricetool"),
    mainPanel(
            img(src = "Audiblue.jpg", height = 200, width = 300, 
                  "  <     ...because you know you want one!    See instructions in sidebar and go for it.  >"), 
            plotOutput('plot', height="700px"))
    ))

