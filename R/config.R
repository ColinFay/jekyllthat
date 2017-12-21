#' Config rmd
#' 
#' A function to be run to add the Rmd regex to the exclude in config.yml
#'
#' @param config_yml the path to your config.yml
#'
#' @export
#'

config_rmd <- function(config_yml = "_config.yml"){
  a <- readLines(config_yml)
  if ( any(grepl('"*\\.Rmd"', a)) ) {
    message("Already set up")
  } else {
    index <- grep('exclude', a)
    write(append(a, '  - "*.Rmd"', index), config_yml)
    message("done")
  }
}
