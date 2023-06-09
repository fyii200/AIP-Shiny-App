shinyUI(
  fluidPage(
    
    # App title
    titlePanel("Area Interaction Point Process Models"),
    
    ## Logo
    tags$head(
      tags$link(rel = "shortcut icon", href = "img/logo.ico"),
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
    ),
    
    list(tags$head(HTML('<link rel="icon", href="img/logo.png",
                        type="image/png" />'))),
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle = "AIP"
        )
    ),
    ## Header
    navbarPage(title = div(img(src="img/logo.png",
                               height = "75px"), style = "padding-left:100px;"),
               id = "navbar",
               selected = "home",
               theme = "styles.css", 
               fluid = T,
               ## Home
               home,
               univariate,
               bivariate,
               about
    ),
  )
)


