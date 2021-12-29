#' Generate a group id named after a regular sequence
#'
#' @param x a vector, typically with some repeated elements defining groups
#'
#' @return A vector with a numeric id starting from 1
#' @export
#'
#' @examples
#' x <- sample(1:5, 30, replace = TRUE)
#' data.frame(group = x, id = seq_group(x))
#' y <- LETTERS[x]
#' data.frame(group = y, id = seq_group(y))
#'
#' # By default, `kmeans` clusters are ordered by the means
#' seq_group(kmeans(mtcars, 3)$cluster)
seq_group <- function(x) {
  match(x, unique(x))
}
