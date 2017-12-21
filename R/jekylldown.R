pandoc2.0 <- getFromNamespace("pandoc2.0", "rmarkdown")

#' jekylldown
#'
#' A markdown output for Jekyll Github
#'
#' @importFrom rmarkdown md_document
#'
#' @export
#'

jekylldown <- function() {
  # From rmarkdow::github_document
  pandoc2 <- pandoc2.0()
  variant <- if (pandoc2) "gfm" else "markdown_github"
  variant <- paste0(variant, "-ascii_identifiers")

  md_document(variant = variant, preserve_yaml = TRUE,
              toc = FALSE, toc_depth = 3, fig_width = 7, fig_height = 5,
              fig_retina = NULL, dev = "png", df_print = "default", includes = NULL,
              md_extensions = NULL, pandoc_args = NULL)

}


