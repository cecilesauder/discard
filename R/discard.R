#' discard
#'
#' @param .data a tbl
#' @param ... Logical predicates defined in terms of the variables in .data.
#' Multiple conditions are combined with &.
#' Only rows where the condition evaluates to TRUE are discarded.
#' @import dplyr
#' @import purrr
#' @return a tbl
#' @export
#'
#' @examples
#' library(dplyr)
#' df <- tibble(
#' x1 = sample(c(-1, 0, 1), size = 1000, replace = TRUE),
#' x2 = sample(c(-1, 0, 1), size = 1000, replace = TRUE),
#' x3 = sample(c(-1, 0, 1), size = 1000, replace = TRUE),
#' x4 = sample(c(-1, 0, 1), size = 1000, replace = TRUE))
#' discard(df, x1 == 0, x2 == 0, x3 == 0, x4 == 0)
discard <- function(.data, ...) {
  quos <- reduce(quos(...), function(x, y) expr(!!x & !!y))
  filter(.data, !(!!quos))
}
