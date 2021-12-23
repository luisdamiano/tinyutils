#' Apply a function to all combinations of variables
#'
#' @param f function taking as many arguments as passed in `...`
#' @param ...vectors, factors or a list containing these
#'
#' @return A list with the result returned by `f` applied to each combination
#' of all the vectors supplied in the ... arguments
#' @export
#' @examples
#' x = month.name
#' y = 2022:2025
#' z = 1:5
#' myfun <- function(x1, x2, x3) { paste(x1, x2, x3) }
#' xpply(myfun, x, y, z)
xpply <- function(f, ...) {
  # Use expand.grid to create a list with all combinations of ... args
  xList <- as.list(do.call(expand.grid, list(...)))

  # Use Map to apply f over all combinations
  do.call(Map, c(list(f = f), unname(xList)))
}
