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


#' Coin categories with market data
#' @description List all categories with market data
#'
#' @param order character. See https://www.coingecko.com/en/api#explore-api for valid values.
#'
#' @return list.
#' @export
#'
#' @examples coin_categories_data()
coin_categories_data <- function(order="market_cap_desc"){

        v <- api_version()
        api_call <- paste0(v, "/coins/categories?order=", order)

        json_dat <- get_json(api_call)
        return(json_dat)

}



