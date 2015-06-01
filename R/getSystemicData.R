######################################################################
#getSystemicData: inquery Pesticidedata from SKEP database
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

getSystemicData <- function(x){
        
        systemic <- tbl(x,"systemic") %>% 
                collect() %>%
                select(-id_syst) %>%
                transform(sys_type_id = as.factor(sys_type_id))
        # save the systemic list to data frame
        systemic.type <- collect(tbl(x,"systemis_type"))$injury
        # rename the systemic type code to name of systemic injuries
        levels(systemic$sys_type_id) <- systemic.type
        
        # make data more tidy
        spread(systemic, sys_type_id, inj_data)
}

