# Q5pricetool server.R

library(shiny)
# library(plotly)
library(ggplot2)

# Could be a dyanmically updated, this data is manually collected late 2014
   setwd(file.path(getwd()))
    dataset <- read.csv("data/Q5rawdata.csv", header=TRUE)
#    dataset <- Q5data 

# Linear model for database
    PriceFit <- lm(Price~Miles+Year+Trim+Engine, data=dataset)

# Resulting prediction fucntion will be called below and use user input    
    PricePredict <- function(miles, year, trim, engine){
        -4713000 - .1971*miles + 2366*year +
        I(1*(trim=='Premium'))+I(653.4*(trim=='PremiumPlus'))+ I(7222*(trim=='Prestige'))+
        I(1*(engine=='C'))+ I(-5717*(engine=='B'))+ I(-6453*(engine=='A'))}
    
shinyServer(
 function(input, output) {

##  Main plot has several options for inputs based on ui.R. Address each with  "if"
#   First plot X axis vs. Y axis

        output$plot <- renderPlot({
        p <- ggplot(dataset, aes_string(x=input$x, y=input$y))+ geom_point(size=3)
 
    #   Next plot color code variable, iff selected      
        if (input$color != 'None')
            p <- p + aes_string(color=input$color)

    #   Next plot column or row facets to graph by different variables in dataset        
        facets <- paste(input$facet_row, '~', input$facet_col)        
        if (facets != '. ~ .')
            p <- p + facet_grid(facets)+ geom_jitter(size=3)

#   Removing the next comment opens an interactive plot in a separate window
    #   (gg <- ggplotly(p))    # this plotly command actually works (keep parantheses), 

    #   This responds to the action button to add a fit line
        if (input$action)
        p <- p+geom_smooth(method="lm", color="red")

##   In all cases, print the main plot, p
        print(p)
    })

##  This plot is a histogram of all listings in dataset, upper left
    output$Q5hist <- renderPlot({
       h <- ggplot(data=dataset, aes(x=Price)) 
       h <- h + geom_histogram(alpha=0.2, fill="blue")
       h <- h + xlab("Price Range, $") + ggtitle("Current New and Used AudiQ5 Listings")   
       print(h)
    }) 

##  This section is for the numerical prediction of a good price
    output$prediction <- renderPrint({
        PricePredict(input$miles, input$year, input$trim, input$engine)})
    
    output$goodprice <- renderPrint({
        PricePredict(input$miles, input$year, input$trim, input$engine)*.88})
 })


# Notes on attempts to pass data frame to PricePredict
# features <- renderDataTable({data.frame(Miles=input$miles, Year=input$year, 
#   Trim=input$trim, Engine=input$engine)})
# discussion boards suggest using renderImage to output a list

# features <- data.frame(Miles=input$miles, Year=input$year, 
#   Trim=input$trim, Engine=input$engine )
# PricePredict <- function(features) predict(PriceFit,newdata=features)
#    df <- reactive({
#    features <- data.frame(input$miles, input$year, header=TRUE)
#    return(list(features=features))})    

