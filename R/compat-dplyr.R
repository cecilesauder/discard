steal <- function(pkg, fun){
  eval(call(":::", sym(pkg), sym(fun)))
}

quo_reduce <- steal("dplyr", "quo_reduce")
all_exprs <- steal("dplyr", "all_exprs")
any_exprs <- steal("dplyr", "any_exprs")
expr_substitute <- steal("dplyr", "any_exprs")
apply_filter_syms <- steal("dplyr", "apply_filter_syms")
tbl_at_syms <- steal("dplyr", "tbl_at_syms")
tbl_if_syms <- steal("dplyr", "tbl_if_syms")
