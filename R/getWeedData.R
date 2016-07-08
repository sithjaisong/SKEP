#' @title Get SYT SKEP weed data
#'
#' @description This function queries the database for weed data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of weed data
#'
#' @return Weed information table (dataframe)
#'
#' @importFrom magrittr %>%
#' @export
getWeedData <- function(x){
        weed.rank <- dplyr::tbl(x, "weed_rank") %>%
                dplyr::collect() %>%
                dplyr::select(-id_weed_rank, -main_weed ) %>%
                transform(weed_type = as.factor(weed_type))
        weed.type <- dplyr::collect(dplyr::tbl(x, "weed_type"))$weed_type
        levels(weed.rank$weed_type) <- weed.type
        weed.rank.df <- tidyr::spread(weed.rank, weed_type, data)
        weed.main <- dplyr::tbl(x, "weed_main") %>%
                dplyr::select(-id_weed_main) %>%
                dplyr::collect() %>%
                transform(area = as.factor(area))
        levels(weed.main$area) <- c("1", "2", "3")
        weed.list <- dplyr::collect(dplyr::tbl(x, "weed_list"))
        all.weed <- dplyr::left_join(weed.main, weed.list, by = "weed_list_id")
        dplyr::left_join(weed.rank.df, all.weed, by = c("id_ci", "area"))
}
