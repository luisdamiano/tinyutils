#' Generate a group id named after a regular sequence
#'
#' @param x a vector, typically with some repeated elements defining groups
#'
#' @return A vector with a numeric id starting from 1
#' @export
#'
#' @examples
#' x <- sample(1:5, 30, replace = TRUE)
#' data.frame(group = x, id = seq_unique(x))
#' y <- LETTERS[x]
#' data.frame(group = y, id = seq_unique(y))
#'
#' # By default, `kmeans` clusters are ordered by the means
#' seq_unique(kmeans(mtcars, 3)$cluster)
seq_unique <- function(x) {
  match(x, unique(x))
}
