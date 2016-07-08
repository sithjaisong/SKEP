#' @title Get SYT SKEP fertilizer data
#'
#' @description This function queries the database for fertilizer data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of fertilizer data
#'
#' @return Fertilizer information table (dataframe)
#'
#' @importFrom magrittr %>%
#' @export
getFertilizerData <- function(x){
        dplyr::left_join(dplyr::tbl(x, "general_info"),
                         dplyr::tbl(x, "fertil_organic"),
                  by = c("id" = "id_main")) %>%
                dplyr::left_join(dplyr::tbl(x, "fertil_mineral"),
                          by = c("id" = "id_main")) %>% dplyr::collect()

        }
