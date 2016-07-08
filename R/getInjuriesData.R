#' @title Get SYT SKEP injury data
#'
#' @description This function queries the database for injury data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of injury data
#'
#' @return Injury data information table (dataframe)
#'
#' @importFrom magrittr %>%
#' @export
getInjuriesData <- function(x){
        injury_info <- dplyr::tbl(x, "crop_injuries") %>%
                dplyr::collect() %>%
                dplyr::select(-c(project, field_num))
        hill.quad <- dplyr::tbl(x, "hill_quad") %>%
                dplyr::collect() %>%
                dplyr::select(-id_hq) %>%
                transform(type_hq = as.factor(type_hq))
        names(hill.quad)[names(hill.quad) == "hq_sample"] <- "sample"
        levels(hill.quad$type_hq) <- c("nt", "np", "nl")
        plant.info <- tidyr::spread(hill.quad, type_hq, data)
        injuries <- dplyr::tbl(x, "injury") %>%
                dplyr::collect() %>%
                dplyr::select(-id_pest_tp) %>%
                transform(inj_tp_type = as.factor(inj_tp_type))
        names(injuries)[names(injuries) == "inj_sample"] <- "sample"
        injury.detail <- dplyr::collect(dplyr::tbl(x, "injury_detail"))$injury
        levels(injuries$inj_tp_type) <- injury.detail
        injuries.data <- tidyr::spread(injuries, inj_tp_type, inj_tp_data)
        temp <- dplyr::left_join(plant.info, injuries.data,
                                 by = c( "id_ci", "sample" ))
        dplyr::left_join(injury_info, temp, by = "id_ci")
}
