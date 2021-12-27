#' Length and dimension of an object after filtering duplicated elements
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
#' ulength(c(1:8, 3:10))
#' unrow(rbind(mtcars, mtcars))
#' udim(do.call(rbind, rep(mtcars, 10)))
ulength <- function(x) {
  length(unique(x))
}

unrow   <- function(x) {
  nrow(unique(x))
}

uncol   <- function(x) {
  ncol(unique(x))
}

udim    <- function(x) {
  dim(unique(x))
}
