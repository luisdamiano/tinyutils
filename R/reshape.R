#' Convert a matrix into a (row, col, val) data frame
#'
#' @param x A matrix
#'
#' @return A `data.frame` with one row per matrix entry and three columns:
#' `row` with the row index, `col` with the column index, and a third column
#' with the matrix entry values. Row and column names will be used as index
#' values if available, these will be sequential numeric otherwise. The
#' column holding the matrix entry value will be named after the variable
#' passed to the function.
#'
#' @examples \dontrun{
#' rainfall <- matrix(1:25, 5, dimnames = list(LETTERS[1:5], month.name[1:5]))
#' str(flatten_matrix(rainfall))
#' # 'data.frame':	25 obs. of  3 variables:
#' #   $ row     : chr  "A" "B" "C" "D" ...
#' #   $ col     : chr  "January" "January" "January" "January" ...
#' #   $ rainfall: int  1 2 3 4 5 6 7 8 9 10 ...
#' }
#' @seealso https://cran.r-project.org/web/packages/slam/index.html for
#' triplet-based functions
as.triplet.matrix <- function(x) {
  nm <- as.character(as.list(match.call())$x)
  i1 <- if (is.null(rownames(x))) seq(nrow(x)) else rownames(x)
  i2 <- if (is.null(colnames(x))) seq(ncol(x)) else colnames(x)
  l  <- setNames(list(
    i1[as.vector(row(x))],
    i2[as.vector(col(x))],
    as.vector(x)
  ), c("row", "col", nm))

  as.data.frame(l)
}
