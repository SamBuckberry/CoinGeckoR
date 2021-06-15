#' Coin categories
#' @description List of coin categories. The function is run with no arguments and retreives the list from the API
#' @return list.
#' @export
#'
#' @examples coin_categories()
coin_categories <- function(){

        v <- api_version()
        api_call <- paste0(v, "/coins/categories/list")
        json_dat <- get_json(api_call)
        return(json_dat)

}
