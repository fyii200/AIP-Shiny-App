library(sjPlot)
library (DT)
library(data.table)
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)
library(ggthemes)
library(ggplot2)
library(plotly)

source("functions/utils.R")
source("functions/uniAIP.R")
colours <- c("#098ebb", "#fdc23a", "#e96449")

## shiny header
tab_files <- list.files(path = "tabs", full.names = T, recursive = T)
tab_files <- tab_files[-grep(x = tab_files, pattern = "server")]

suppressMessages(lapply(tab_files, source))


