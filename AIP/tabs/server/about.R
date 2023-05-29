output$about <- renderUI({
  trump <- includeMarkdown('descriptions/trump.md')
  paste(trump, br())
  
})