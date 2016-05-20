######################################################################
#getPestManagementData: query pest management data from SYT SKEP database
######################################################################
#'
#' Get pest management data
#'
#' @param x is mySQL data
#'
#' @details x class SQL
#'
#'
#' @return
#' Fertilizer information table (dataframe)
#'
#' @examples x value
#' @keywords
#' MySQL
#'
#' @export
getPestManagementData <- function(x){

        tbl(x, "general_info") %>%
                left_join(tbl(x, "weed_mgmt"), by = c("id" = "id_main")) %>%
                left_join(tbl(x, "pesticides"), by = c("id" = "id_main")) %>%
                left_join(tbl(x, "fungicide"), by = c("id" = "id_main")) %>%
                collect()
}

# eos
