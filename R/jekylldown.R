#' jekylldown
#' 
#' A markdown output for Jekyll Github
#' 
#' @importFrom rmarkdown md_document
#' 
#' @export
#' 

jekylldown <- function() {
  md_document(variant = "gfm", preserve_yaml = TRUE,
              toc = FALSE, toc_depth = 3, fig_width = 7, fig_height = 5,
              fig_retina = NULL, dev = "png", df_print = "default", includes = NULL,
              md_extensions = NULL, pandoc_args = NULL)
  
}