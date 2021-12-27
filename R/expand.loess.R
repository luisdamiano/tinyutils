#' Create a data frame with the output interpolated at all combinations
#' of inputs via LOESS
#'
#' @param x a vector of predictors in the first dimension
#' @param y a vector of predictors in the second dimension
#' @param z a vector of outputs to be interpolated
#' @param resolution either `NULL` or a numeric value.
#' If `NULL` (default), the resulting data.frame will expand
#' all possible combinations of `x` and `y`.
#' If numeric, the length of the predictor sequence in one dimension
#' @param ... arguments passed to `loess`
#'
#' @return A `data.frame` with resolution^2 rows
#' @export
#' @note TODO Re-define as expand.loess(output, ...)
#'
#' @examples
#' x <- rnorm(20)
#' y <- runif(20)
#' z <- x^2 + sin(y)
#' str(expand.loess(x, y, z))
#' str(expand.loess(x, y, z, resolution = 10))
expand.loess <- function(x, y, z, resolution = NULL, ...) {
  f <- function(u) { seq(min(u), max(u), len = resolution) }
  if (is.null(resolution))
    f <- identity

  fit     <- loess(z ~ x + y, ...)
  grdDF   <- expand.grid(x = f(x), y = f(y))
  grdDF$z <- predict(fit, data.frame(grdDF))

  return(grdDF)
}
