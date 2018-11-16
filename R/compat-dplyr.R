apply_filter_syms <- function(...) abort("")
tbl_at_syms <- function(...) abort("")
tbl_if_syms <- function(...) abort("")

.onLoad <- function(...) {
  dplyr <- asNamespace("dplyr")
  apply_filter_syms <<- dplyr$apply_filter_syms
  tbl_at_syms <<- dplyr$tbl_at_syms
  tbl_if_syms <<- dplyr$tbl_if_syms
}
