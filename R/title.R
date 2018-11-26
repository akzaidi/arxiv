
#' Create filename from arxiv URL
#'
#' Arxiv holds a collection of pre-prints for a variety of scientitic
#' topics and research areas. Calibre is a handy tool to save and
#' catalog different articles and books in a single location.
#' This function downloads metadata from an arxiv URL and creates a file
#' name corresponding to the paper in the Calibre standard format.
#'
#' @param arx_url a string containing the URL for arxiv paper
#' @return A filename containing the calibre style title for arxiv URL
#'
#' @export
create_filename <- function(arx_url) {

  library(rvest)
  library(magrittr)
  library(stringr)

  if (str_detect(arx_url, "abs")) {
    arx_url <- gsub("abs", "pdf", arx_url)
    arx_url <- paste0(arx_url, ".pdf")
  }

  arx_url <- substr(arx_url,
                    1, nchar(arx_url) - 4)

  arx_html <- read_html(gsub("pdf", "abs", arx_url))

  title_author <- html_nodes(arx_html, ".title , .authors") %>% html_text
  title <- title_author[1] %>% str_replace("Title:", "") %>%
    str_replace("/", " ")

  authors <- str_replace(title_author[2], "Authors:", "") %>%
    str_split(string = ., pattern = ", ") %>%
    unlist %>% str_replace(string = ., pattern = "\n    ", replacement = "")
  # authors <- title_author[2] %>% str_replace("Authors:", "") %>% str_split(pattern = ", ")[[1]] %>%
  #   str_replace("\n  ", "")
  # # first element is "Authors:"
  # authors <- authors[2:length(authors)]
  # authors <- gsub(", ", "", authors)

  # max out at 5 authors
  if (length(authors) > 5) {
    author <- paste0(authors[1], " et al.")
  } else {
    author <- paste0(authors, collapse = " & ")
  }

  file_name <- str_c(author, " - ", title)
  file_name <- gsub("  ", " ", file_name)
  file_name

}

#' Dowload paper locally
#'
#' Downloads paper and renames it using the \code{create_filename} function
#'
#' @param arx_url a string containing the arxiv URL
#' @param loc a string containing the file path to save it to
#' @param title a string containing the filename, defaults to \code{create_filename} on \code{arx_url}
#'
#' @export
download_paper <- function(arx_url, loc,
                           title = create_filename(arx_url),
                           overwrite = FALSE) {

  if (str_detect(arx_url, "abs")) {
    arx_url <- gsub("abs", "pdf", arx_url)
    arx_url <- paste0(arx_url, ".pdf")
  }

  if (str_detect(arx_url, "aclweb")) {
    arx_url <- str_replace(arx_url, "http", "https")
    arx_url <- str_replace(arx_url, "aclweb.org", "aclanthology.info")
    arx_url <- str_replace(arx_url, "/anthology/", "/papers/")
    arx_list <- str_split(arx_url, "/")[[1]]
    arx_list <- c(arx_list, str_to_lower(arx_list[length(arx_list)]))
    arx_url <- str_c(arx_list, collapse = "/")

  }

  cat(sprintf("Saving file: \n%s \nto: \n%s \n",
                title, loc))

  if (!dir.exists(loc)) {
    cat(sprintf("Creating directory %s as it doesn't exist", loc))
    dir.create(loc)
  }

  dest_file <- paste0(file.path(loc, title), ".pdf")

  if (file.exists(dest_file) && !overwrite) {
    warning(sprintf("Exiting, file %s already exists and overwrite is set to FALSE", dest_file))
  } else {
    download.file(url = arx_url,
                  destfile = dest_file)

  }

}
