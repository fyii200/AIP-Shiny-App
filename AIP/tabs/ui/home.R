home <- tabPanel(title = "Home", 
                 value = "home",
                 hr(),
                 br(), br(),
                 HTML("<h1><center>Welcome to the <b>AIP</b> Demo Page</center></h1>"),
                 br(), br(), br(), br(),
                 column(width = 4, align = "center",
                        tab_AIP(text = "Univariate analysis", col = colours[1], icon = "analysis.png", id = "univariate")
                        ),
                 column(width = 4, align = "center",
                        tab_AIP(text = "Bivariate analysis", col = colours[2], icon = "analysis.png", id = "bivariate")
                 ),
                 column(width = 4, align = "center",
                        tab_AIP(text = "About us", col = colours[3], icon = "about.png", id = "about")
                 ),
                 column(width = 12,
                        br(), br(), br(), br(),
                        wellPanel(
                          HTML("<h1><b>AIP</b></h1>"),
                          HTML("<h4> This app provides an overview of the importance of area interaction point process models 
                          using mainly the R package <b>AIP</b> and facilitates analysis of pre-loaded data for univariate area 
                          interaction point processes. The app will also allow users to upload a small dataset for analysis.  
                          For now, we will only provide code for univariate area interaction point processes, but plan to extend 
                          this to bivariate area interaction point processes. </h4>")
                        )
                 )
)
