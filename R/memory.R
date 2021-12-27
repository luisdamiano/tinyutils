#' Print object size
#'
#' @param x an object, or `NULL` (default) to print all objects in `.GlobalEnv`
#'
#' @return a named vector of with the sizes in Mb
#' @export
#'
#' @examples
#' posize(mtcars)
#' posize()
posize  <- function(x = NULL) {
  if (!is.null(x))
    return(print(object.size(x), units = "auto"))

  osizes <- sapply(ls(.GlobalEnv), function(li) { object.size(get(li)) })

  print(round(osizes[rev(order(unlist(osizes)))] / 1000000, 1))
}

#' Print memory used by R
#'
#' @param print
#'
#' @return
#' @export
#'
#' @examples
mem_used <- function(print = TRUE) {
  # https://github.com/cran/lobstr/blob/3d7749df14d430f8a1dcab618d196013cf9c1cd9/R/mem.R#L21
  # nodeSize  <- switch(
  #   as.character((8L * .Machine$sizeof.pointer)),
  #   "32" = 28L, "64" = 56L, stop("Unknown architecture"))
  # usedBytes <- sum(gc()[, 1] * c(nodeSize, 8))
  # print(structure(usedBytes, class = "object_size"), units = "auto")
  x <- sum(gc()[, 2])
  if (print) cat(sprintf("%g Mb", x))
  invisible(x)
}
