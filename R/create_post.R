#' Create a post
#'
#' @param title post title
#' @param dir output directory (default to _posts)
#' @param url the output url
#' @param date the date of the post
#'
#' @import glue
#'
#' @return creates a post

create_post <- function(title, dir = "_posts", url = title,
                        date = Sys.Date(), author = "author", layout = "single") {
  if(! dir.exists(dir) ) dir.create(dir)
  a <- system.file("rmarkdown","templates", "template_crea", "skeleton", "skeleton.Rmd", package = "jekyllthat")
  a <- readLines(a)
  a <- gsub("Title", title, a)
  a <- gsub("Date", Sys.Date(), a)
  a <- gsub("Author", author, a)
  a <- gsub("single", layout, a)
  lowtitle <- gsub(" ", "-", tolower(url))
  lowtitle <- URLencode(lowtitle)
  out_names <- paste(glue("{Sys.Date()}-{lowtitle}.Rmd"))
  a <- gsub("/link", glue("/{lowtitle}/"), a)
  out <- file.path(dir, out_names)
  if (file.exists(out)) stop("File already exists")
  write(a, out)
  file.edit(out)
}

#' @import shiny
#' @import miniUI
#' @export


create_post_widget <- function(inputValue1, inputValue2) {
  ui <- miniPage(
    gadgetTitleBar("Create a new post"),
    miniContentPanel(
      textAreaInput(inputId = "title", label = "Post Title", value = "Title"),
      textAreaInput(inputId = "dir", label = "Post directory", value = "_posts"),
      textAreaInput(inputId = "url", label = "Post url", value = "post-title"),
      dateInput(inputId = "date", label = "Post date"),
      textAreaInput(inputId = "author", label = "Post author", value = "author"),
      textAreaInput(inputId = "layout", label = "Post layout", value = "single")
    )
  )

  server <- function(input, output, session) {
    observeEvent(input$done, {
      returnValue <- list(title = input$title, dir = input$dir, url = input$url,author = input$author,
                          date = input$date,
                          layout = input$layout)
      stopApp(
        create_post(title = returnValue$title,
                    dir = returnValue$dir,
                    url = returnValue$url,
                    author = returnValue$author,
                    layout = returnValue$layout,
                    date = returnValue$date)
        )
    })
  }

  runGadget(ui, server, viewer = dialogViewer("Create new post"))
}
