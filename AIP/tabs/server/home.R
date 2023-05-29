observeEvent(input$univariate,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "univariate")
})
observeEvent(input$bivariate,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "bivariate")
})
observeEvent(input$about,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "about")
})