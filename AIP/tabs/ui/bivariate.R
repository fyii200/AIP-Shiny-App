tab_files <- list.files(path = "tabs/ui/bivariate", full.names = T)
suppressMessages(lapply(tab_files, source))

bivariate <- tabPanel(title = "Bivariate", 
                      value = "bivariate",
                      hr(),
                      tabsetPanel(
                        tabPanel("Under construction", span(textOutput("text"), 
                                                            style="color:maroon; font-size:16px"))
                        )
)
