
#' Coins list
#' @description List all supported coins id, name and symbol.
#' @param include_platform logical.
#'
#' @return list.
#' @export
#'
#' @examples coins_list()
coins_list <- function(include_platform=FALSE){

        v <- api_version()
        api_call <- paste0(v, "coins/list?include_platform=",
                           casefold(include_platform))
        json_dat <- get_json(api_call)
        return(json_dat)

}
