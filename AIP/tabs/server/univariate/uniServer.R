data <- reactive({
  req(input$file1) ## ?req #  require that the input is available

  inFile <- input$file1
  df <- read.csv(inFile$datapath)
  
  # Update inputs 
  updateSelectInput(session, inputId = 'xcol', label = 'X Variable',
                    choices = names(df), selected = names(df)[1])
  updateSelectInput(session, inputId = 'ycol', label = 'Y Variable',
                    choices = names(df), selected = names(df)[2])

  return(df)
})


output$univariatePlot <- renderPlotly({
  radius <- input$radius # radius as specified by user
  x = data()[, input$xcol]
  y = data()[, input$ycol]
  w = owin(c(0,96), c(0,99))
  
  layout(matrix(c(1,2), nrow = 1, ncol = 2, byrow = FALSE), widths=c(2,1))
  par(mai = c(1, 0, 0.5, 0))

  ## AIP
  
  # Compute coefs
  coefficients <- uniAIP(x, y, radius)
  AIPintercept <- coefficients[1]
  AIPinter <- coefficients[2]
  AIPtxt <- paste(' Intercept:', AIPintercept, ';', 'Interaction:', AIPinter)
  
  # Plot
  X <- data.frame("x"=x, "y"=y)

  p <- ggplot(X, aes(x,y)) +
    theme_void() +
    geom_text(aes(x = x, y = y, label = '·'), 
              size = 7,
              show.legend = FALSE,
              vjust = 'center',
              hjust = 'center') +
    geom_point(size=radius*2, colour="blue", alpha=0.1) 
  ggplotly(p) %>%
    layout(title = list(text = paste0('Point pattern with discs',
                                      '<br>', '<br>',
                                      '<sup>',
                                      AIPtxt,'</sup>',
                                      '<br>')),
           margin = list(t = 100))
  
    

    

  # # spatstat
  # w = owin(c(0,96), c(0,99))  # Window
  # X1 = ppp(x, y, window=w)
  # fit <- ppm(X1, trend=~1, interaction=AreaInter(radius))
  # coefficients <- as.numeric(coef(fit))
  # SpatIntercept <- round(coefficients[1],2)
  # SpatInter <- round(coefficients[2],2)
  # SpatTxt <- paste('Spatstat
  # -------------------------
  # Intercept: ', SpatIntercept, '\n',
  # 'Interaction:', SpatInter)
  # text(0.3, 0.4, SpatTxt, col="blue", cex=1.5)
})

output$content <- renderDataTable(
  datatable(
    data(), 
    extensions = 'Buttons',
    options = list(
      dom = 'Bfrtip',
      lengthMenu = list(c(5, 15, -1), c('5', '15', 'All')),
      pageLength = 15,
      columnDefs = list(list(width = '10px', targets = "_all")),
      buttons = list(
        list(
          extend = "collection",
          text = 'Show All',
          action = JS("function ( e, dt, node, config ) {
                                    dt.page.len(-1);
                                    dt.ajax.reload();
                                }")
        )
      )
    )
  )
)

output$tutorial <- renderUI({
  url <- a("Link to tutorial", 
           href="https://thestatsclinic.shinyapps.io/point-pattern-analyses-an-introduction/",
           style = "font-family: Menlo; font-size: 20px")
  tagList("", url)
})














