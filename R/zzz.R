# From swirl, Learn R, in R. http://swirlstats.com
# License: MIT + file LICENSE
# Swirl version on GitHub: https://github.com/swirldev/swirl/blob/master/R/zzz.R
#
.onAttach <- function(...) {
        if (length(ls(envir = globalenv())) > 0) {
                packageStartupMessage(
                        make_pretty("Hi! I see that you have some variables
                                    saved in your", "workspace. To keep things
                                    running smoothly, I recommend you clean up,
                                    before starting to query the SYT SKEP
                                    data.",
                                    skip_after = TRUE),
                        make_pretty("Type ls() to see a list of the variables
                                    in your workspace.", "Then, type
                                    rm(list = ls()) to clear your workspace.",
                                    skip_after = TRUE),
                        make_pretty("Type ?loginSKEP() to see how you access to
                                    the database.",
                                    skip_after = TRUE)
                )
        } else {
                packageStartupMessage(
                        make_pretty("Welcome to the SYT SKEP database! Please,
                                    type ?loginSKEP() to see how you can access
                                    the database.",
                                    skip_after = TRUE)
                )
        }
        invisible()
}

make_pretty <- function(..., skip_before = TRUE, skip_after = FALSE) {
        wrapped <- strwrap(stringr::str_c(..., sep = " "),
                           width = getOption("width") - 2)
        mes <- stringr::str_c("|(^.^) ", wrapped, collapse = "\n")
        if (skip_before) mes <- paste0("\n", mes)
        if (skip_after) mes <- paste0(mes, "\n")
        mes
}
