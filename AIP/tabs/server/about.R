output$about <- renderUI({
  glenna <- includeMarkdown('descriptions/glenna.md')
  mike <- includeMarkdown('descriptions/mike.md')
  fabian <- includeMarkdown('descriptions/fabian.md')
  paste(glenna, br(), mike, br(), fabian)
})