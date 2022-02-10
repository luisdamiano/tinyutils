#' Conditional Stop with Arbitrary Function
#'
#' @param ...
#' @param fun
#'
#' @return
#' @export
#'
#' @examples
#' TODO: make default message based on fun name
stopiffun <- function(fun, ...) {
  if (any(fun(...)))
      stop(substitute(fun), " is TRUE for at least one entries")
}

#' @inherit
#' @examples stopiffun
#' f <- function() { NULL } # Function that returns NULL if error
#' # Keep the returned value if it NULL
#' f() |> stopifnull(0)
#' stopifnull(f(), 0)
stopifnull <- function(...) {
  stopiffun(is.null, ...)
}

#' @inherit
#' @examples stopiffun
#' stopifna(airquality[, 1])
stopifna <- function(...) {
  stopiffun(is.na, ...)
}
