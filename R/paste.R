#' Concatenate strings with new lines
#'
#' @param ... one or more R objects, to be converted to character vectors.
#'
#' @return
#' @export
#'
#' @examples
#' pasten("Line 1", "Line 2", "Line 3")
pasten <- function(...) {
  paste(..., sep = "\n")
}


