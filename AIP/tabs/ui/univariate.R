tab_files <- list.files(path = "tabs/ui/univariate", full.names = T)
suppressMessages(lapply(tab_files, source))

univariate <- tabPanel(title = "Univariate",
                       value = "univariate",
                       hr(),
                       tabsetPanel(
                         # Sidebar layout with input and output definitions ----
                         sidebarLayout(

                           # Sidebar panel for inputs ----
                           sidebarPanel(

                             # br() element to introduce extra vertical spacing ----
                             br(),

                             # Input: Slider for the number of observations to generate ----
                             sliderInput("radius",
                                         "Disc radius:",
                                         value = 5,
                                         min = 1,
                                         max = 10),

                             # Input: CSV file
                             fileInput('file1', 'Upload CSV file',
                                       accept=c('csv', 'comma-separated-values','.csv')),


                             # Allow user to specify x and y variables
                             # "Empty inputs" - they will be updated after the data is uploaded
                             selectInput('xcol', 'X Variable', ""),
                             selectInput('ycol', 'Y Variable', "", selected = "")

                           ),

                           # Main panel for displaying outputs ----
                           mainPanel(
                             
                             # Output: Tabset w/ plot, summary, and table ----
                             div(
                               tabsetPanel(type = "tabs",
                                           tabPanel("Plot", plotOutput("univariatePlot", height="550px", width="800px")),
                                           tabPanel("Tutorial", verbatimTextOutput("m")),
                                           tabPanel("Dataset", dataTableOutput("content", height="500px", width="550px"))

                               )
                             )
                           )
                         )
                       ),
                class = "span8"
)









