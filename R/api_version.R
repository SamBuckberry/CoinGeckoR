#' Set the API version.
#'
#' @return character. A string that sets the version for the API call to be used in all other functions.
#' @export
#'
#' @examples api_version()
#'
api_version <- function(){
        "https://api.coingecko.com/api/v3/"
}


#' Make the call to the CoinGecko API
#'
#' @param api_call character
#'
#' @return list
#' @export
#'
#' @examples get_json("https://api.coingecko.com/api/v3/ping")
#'
get_json <- function(api_call){

        json_dat <- RCurl::getURLContent(api_call)
        dat <- RJSONIO::fromJSON(json_dat)
        return(dat)

}
