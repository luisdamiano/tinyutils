#' @inherit iffun
#' @examples
#' f <- function() { NULL } # Function that returns NULL if error
#' # Keep the returned value if it NULL
#' f() |> ifnull(0)
#' ifnull(f(), 0)
ifnull <- function(test, yes, no = test) {
  iffun(is.null, test, yes, no)
}

#' @inherit iffun
#' @examples
#' # Impute all missing values with 0
#' ifna(airquality[, 1], 0)
ifna   <- function(test, yes, no = test) {
  iffun(is.na, test, yes, no)
}

#' Conditional Element Selection with arbitrary function
#'
#' @param test an object which can be coerced to logical mode.
#' @param yes return values for true elements of test.
#' @param no return values for false elements of test. Default is `yes`
#' @param fun the function to be applied to the vector test.
#'
#' @return Same as ?ifelse
#' @export
#'
#' @examples
#' # Impute all missing values with 0
#' iffun(is.na, airquality[, 1], 0)
iffun <- function(fun, test, yes, no = test) {
  ifelse(fun(test), yes, no)
}
