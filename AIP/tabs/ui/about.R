about <- tabPanel(title = "About us", 
                  value = "about", 
                  br(), hr(),
                  includeHTML(rmarkdown::render('descriptions/glenna.Rmd')), br(),
                  includeHTML(rmarkdown::render('descriptions/mike.Rmd')), br(),
                  includeHTML(rmarkdown::render('descriptions/fabian.Rmd'))
)