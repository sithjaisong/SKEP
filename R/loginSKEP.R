######################################################################
# SKEP.key: login to the SKEP data base
######################################################################
#'
#' Provide login credentials for SYT SKEP database
#'
#' @param username MUST BE Character
#'
#' @param password MUST BE Character
#' @details
#' Provides access to the SYT SKEP database to retrieve and organize data for analysis
#'
#' @export
#'
#' @return
#' Data frame with SYT SKEP data for further analysis
#'
#' @examples loginSKEP("username", "userpass") # not run
#' @keywords
#' MySQL
#'

loginSKEP <- function(username, password){
        #
        # urUsername <- "username"
        # urPassword <- "userpass"

        # login to the database and load tables
        if (class(username) != "character" & class(password) != "character") {
                stop("Please check your username or password, they must be characters.")
        } else {
                mydb <- src_mysql(user = username,
                                  password = password,
                                  dbname = "syngenta",
                                  host = "crophealth.irri.org"
                )
        }
}
