dataExplore <- function(data){
  library('rmarkdown')
  #render 
  rmarkdown::render("main.Rmd", params = list(
    data = data
  ))
}