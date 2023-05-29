shinyServer(function(input, output, session){
  ##-- HOME ----
  source("tabs/server/home.R", local = TRUE)
  ##-- Univariate ----
  source("tabs/server/univariate/uniServer.R", local = TRUE)
  ##-- Bivariate ----
  source("tabs/server/bivariate/biServer.R", local = TRUE)
  ##-- About ----
  source("tabs/server/about.R", local = TRUE)
})
