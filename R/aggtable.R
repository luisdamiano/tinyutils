#' Create a two-way table with a summary statistics
#'
#' @param x an object
#' @param by a list of grouping elements, each as long as `x`
#' @param FUN a function to compute the summary statistics which can be applied
#' to all data subsets.
#'
#' @return A matrix with named dimensions
#' @export
#'
#' @examples
#' aggtable(mtcars$mpg, mtcars[, c("carb", "gear")], mean)
aggtable <- function(x, by, FUN) {
  addmargins(
    xtabs(x ~ ., aggregate(x, by, FUN), subset = seq(x)),
    FUN = FUN, quiet = TRUE)
}
