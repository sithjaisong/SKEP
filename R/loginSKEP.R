#' @title login to the SKEP data base
#'
#'@description This function provides login capabilities to log into and
#'retrieve data from the IRRI/SYT SKEP Phase II database hosted on AWS.
#'
#' @param username MUST BE Character
#' @param  password MUST BE Character
#'
#' @details This function provides access to the SYT SKEP database to retrieve
#' and organize data for analysis.
#' @examples
#' \dontrun{
#' loginSKEP("username", "userpass")
#' }
#'
#' @export
loginSKEP <- function(username, password){

        mydb <- NULL

        if (class(username) != "character" & class(password) != "character") {
                stop("Please check your username or password,
                     they must be characters.")
        } else {
                mydb <- dplyr::src_mysql(user = username,
                                  password = password,
                                  dbname = "syngenta_production",
                                  host = "pdmsyng.cifebhddqikl.ap-southeast-1.rds.amazonaws.com"
                )
        }
}
