#' @title Get SYT SKEP yield data
#'
#'@description This function queries the database for crop cut yield data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of crop cut yield data
#'
#' @return Crop cut yield information table (dataframe)
#'
#' @importFrom magrittr %>%
#' @export
getYieldData <- function(x){
        dplyr::tbl(x, "general_info") %>%
                dplyr::left_join(dplyr::tbl(x, "weight_harv"),
                                 by = c("id" = "main_id")) %>%
                dplyr::collect()
}
