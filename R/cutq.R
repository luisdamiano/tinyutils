#' Convert numeric to factor of roughly equal content using quantiles
#'
#' @param x a numeric vector which is to be converted to a factor by cutting.
#' @param breaks a single number giving the number of intervals with roughly
#' equal content in which `x` is to be cut.
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' x <- rnorm(100)
#' table(cut(x, 10))
#' table(cutq(x, 10))
cutq <- function(x, breaks, ...) {
  if (!(is.atomic(breaks) & is.numeric(breaks)))
    stop("`breaks` need to be a single number")

  qs <- quantile(x, seq(0, 1, length.out = breaks + 1))
  cut(x, qs, include.lowest = TRUE, right = TRUE, ...)
}
