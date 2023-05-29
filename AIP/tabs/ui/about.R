about <- tabPanel(title = "About us", 
                  value = "about", 
                  br(), hr(),
                  includeHTML(rmarkdown::render('descriptions/trump.Rmd'))
)