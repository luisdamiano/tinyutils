#' Return the first and last parts of an object
#'
#' @param x an object
#' @param n1 integer with the number of head observations.
#' @param n2 integer with the number of tail observations.
#' @param bindFun function used to find the head and tail objects.
#'
#' @return
#' @export
#'
#' @examples
#' hail(mtcars)
#' hail(LETTERS, 6, 4, `c`)
#' hail(LETTERS, 6, 4, `rbind`)
#' hail(LETTERS, 6, 4, `cbind`)
#' hail(as.list(LETTERS), 6, 4, `c`)
hail <- function(x, n1 = 6L, n2 = n1, bindFun = rbind) {
  bindFun(head(x, n1), tail(x, n1))
}
