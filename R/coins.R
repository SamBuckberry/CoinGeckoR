
coins <- get_json("https://api.coingecko.com/api/v3/coins/list?include_platform=false")
coins <- do.call(rbind, coins)
