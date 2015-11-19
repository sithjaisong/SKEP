######################################################################
#getPestManagementData: inquery Pest control Management data from SKEP database
######################################################################
#'
#' Get Farmer Management data
#'
#' @param x is mySQL data
#'
#' @details x class SQL
#'
#' @export
#'
#' @return
#' Fertilizer information table (dataframe)
#'
#' @examples x value
#' @keywords
#' MySQL
#'

getPestManagementData <- function(x){

        tbl(x,"general_info") %>%
                left_join(tbl(x,"weed_mgmt"), by = c("id" = "id_main")) %>%
                left_join(tbl(x,"pesticides"), by = c("id" = "id_main")) %>%
                left_join(tbl(x,"fungicide"), by = c("id" = "id_main")) %>%
                collect()
}

# eos
