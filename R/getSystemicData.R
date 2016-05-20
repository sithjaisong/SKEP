#' @title Get SYT SKEP systemic injury data
#'
#' @description This function queries the database for systemic injury data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of systemic injury data
#'
#' @return Systemic injury information table (dataframe)
#'
#' @importFrom magrittr "%>%"
#' @export
getSystemicData <- function(x){
        systemic <- dplyr::tbl(x, "systemis") %>%
                dplyr::collect() %>%
                dplyr::select(-id_syst) %>%
                transform(sys_type_id = as.factor(sys_type_id))
        systemic.type <- dplyr::collect(dplyr::tbl(x, "systemis_type"))$injury
        levels(systemic$sys_type_id) <- systemic.type
        tidyr::spread(systemic, sys_type_id, inj_data)
}
