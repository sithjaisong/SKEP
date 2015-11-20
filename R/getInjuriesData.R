######################################################################
#getInjuriesData: inquery Injury information from SKEP database
######################################################################
#'
#'Get Injury data
#' @param x is mySQL data
#'
#' @details
#'
#'
#' @export
#'
#' @return
#' Fertilizer information table (dataframe)
#'
#' @examples a value x
#' @keywords
#' MySQL
#'

getInjuriesData <- function(x){

        injury_info <- tbl(x, "crop_injuries") %>%
                collect() %>%
                select(-c(project , field_num))

        hill.quad <- tbl(x, "hill_quad") %>%
                collect() %>%
                select(-id_hq) %>%
                transform(type_hq = as.factor(type_hq))


        names(hill.quad)[names(hill.quad) == "hq_sample"] <- "sample"

        # rename factor names of type_hq from code to abbreviation
        levels(hill.quad$type_hq) <- c("nt", "np", "nl")

        # reference of tyope of hill data
        #type_hq <- tbl(mydb, "type_hq")

        # make data tidy
        plant.info <- spread(hill.quad, type_hq, data)

        #==============

        injuries <- tbl(x, "injury") %>%
                collect() %>%
                select(-id_pest_tp) %>%
                transform(inj_tp_type = as.factor(inj_tp_type))

        # rename inj_sample to sample for matching with the hill data
        names(injuries)[names(injuries) == "inj_sample"] <- "sample"

        # save list of injuires
        injury.detail <- collect(tbl(x,"injury_detail"))$injury

        #rename the levels of injury types
        levels(injuries$inj_tp_type) <- injury.detail

        # make data more tidy
        injuries.data <- spread(injuries, inj_tp_type, inj_tp_data)

        # join the hill data and injury data
        temp <- left_join(plant.info, injuries.data, by = c( "id_ci", "sample" ))

        # combine with the crop_injuries data frame

        left_join(injury_info, temp, by = "id_ci")

}
