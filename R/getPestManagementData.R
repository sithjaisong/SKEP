######################################################################
#getPestManagementData: inquery Pesticidedata from SKEP database
######################################################################
#'
#' Assess to the data base
#'
#' @param x is mySQL data
#'
#' @param country is code
#' @details x
#' 
#'
#' @export x
#'
#' @return
#' Fertilizer information table (dataframe)
#'
#' @examples a value x
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