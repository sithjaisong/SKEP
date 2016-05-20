#' @title Get SYT SKEP pest management data
#'
#' @description This function queries the database for pest management data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of pest management data
#'
#' @return Pest management information table (dataframe)
#'
#' @importFrom magrittr "%>%"
#' @export
getPestManagementData <- function(x){
        dplyr::tbl(x, "general_info") %>%
                dplyr::left_join(dplyr::tbl(x, "weed_mgmt"),
                                 by = c("id" = "id_main")) %>%
                dplyr::left_join(dplyr::tbl(x, "pesticides"),
                                 by = c("id" = "id_main")) %>%
                dplyr::left_join(dplyr::tbl(x, "fungicide"),
                                 by = c("id" = "id_main")) %>%
                dplyr::collect()
}
