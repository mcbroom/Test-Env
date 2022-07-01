library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("nbins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            numericInput("bw", 
                         "Bandwidth", 
                         min = 0.00001, 
                         max = 1000,
                         value = 3.988)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$nbins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$nbins + 1)

        # draw the histogram with the specified number of bins
        hist(x, probability = T, breaks = bins, col = 'darkgray', 
             border = 'white')
        lines(density(x, bw = input$bw), col = "blue")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
