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

#' @export
dplyr::all_vars

#' @export
dplyr::any_vars

#' @export
dplyr::vars

#' @export
tidyselect::starts_with

#' discard all
#'
#' @param .tbl A tbl object
#' @param .vars_predicate See [dplyr::filter_all()]
#' @param .vars See [dplyr::filter_all()]
#' @param .predicate See [dplyr::filter_all()]
#'
#' @examples
#'
#' discard_all(mtcars, all_vars(. > 150))
#' discard_all(mtcars, any_vars(. > 150))
#'
#' discard_at(mtcars, vars(starts_with("d")), any_vars((. %% 2) == 0))
#'
#' @export
discard_all <- function(.tbl, .vars_predicate) {
  syms <- syms(tbl_vars(.tbl))
  pred <- apply_filter_syms(.vars_predicate, syms, .tbl)
  filter(.tbl, !(!!pred))
}

#' @rdname discard_all
#' @export
discard_at <- function(.tbl, .vars, .vars_predicate) {
  syms <- tbl_at_syms(.tbl, .vars, .include_group_vars = TRUE)
  pred <- apply_filter_syms(.vars_predicate, syms, .tbl)
  filter(.tbl, !(!!pred))
}

#' @rdname discard_all
#' @export
discard_if <- function(.tbl, .predicate, .vars_predicate) {
  syms <- tbl_if_syms(.tbl, .predicate, .include_group_vars = TRUE)
  pred <- apply_filter_syms(.vars_predicate, syms, .tbl)
  filter(.tbl, !(!!pred))
}
