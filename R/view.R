#' Invoke a CSV viewer
#'
#' @param x an object to be written, preferably a matrix or data frame.
#' If not, it is attempted to coerce x to a data frame. It is passed to
#' `write.table`
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#'   View.csv(mtcars)
#' }
View.csv  <- function(x) {
  f <- tempfile(fileext = ".csv")
  write.csv(x, file = f)
  system(sprintf("xdg-open %s", f))
}
