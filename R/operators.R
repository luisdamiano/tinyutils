#' Compose two functions
#'
#' @param ...Arguments to be passed to the left function
#'
#' @return A function calling f2(f1(...))
#' @export
#'
#' @examples
#' # Count missing data per column
#' sapply(airquality, is.na %:% sum)
`%:%` <- function(f1, f2) { function(...) { f2(f1(...)) } }
