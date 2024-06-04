msg <- function(...) {
  if (!isTRUE(getOption("bisonpicsuite.quiet"))) {
    packageStartupMessage(...)
  }
}

#' List all bisonpicsuite packages
#'
#' Inspired by `tidyverse::tidyverse_packages()`.
#' @param include_self Include bbousuite in the list?
#' @export
#' @examples
#' bisonpicsuite_packages()
bisonpicsuite_packages <- function(include_self = TRUE) {
  raw <- utils::packageDescription("bisonpicsuite")$Imports
  imports <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", imports)
  names <- vapply(strsplit(parsed, "\\s+"), "[[", 1, FUN.VALUE = character(1))

  if (include_self) {
    names <- c(names, "bisonpicsuite")
  }

  names
}
