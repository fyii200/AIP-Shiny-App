output$about <- renderUI({
  augusto <- includeMarkdown('descriptions/trump.md')
  paste(augusto, br(), douglas, br(), felipe, br(), lucas, br(), luis)
  
})