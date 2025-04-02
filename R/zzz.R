#' @importFrom utils globalVariables

NULL

globalVariables(c("."))

# Default logger object
# Initialize a default logger at package load
.onLoad <- function(libname, pkgname) {
  logger <- logger("DEBUG", appenders = console_appender(layout = cli_fmt))
  SetLogger(logger)
}

# format startup message
gsmStartupMessage <- function() {
  load_msg <- paste0(
    "This is  version ",
    packageVersion("gsm"), " of the gsm package."
  )
  warning_header <- cli::rule(
    left = cli::style_bold("{gsm} Package Deprecation")
  )
  warning_msg <- paste0(
    cli::col_red(cli::symbol$info),
    cli::col_br_red(paste0(
      " As of March 2025, {gsm} has been replaced by a series of modularized packages.",
      "\n", cli::col_red(cli::symbol$info),
      " See the ",
      cli::format_inline("{.href [gsm.core](https://gilead-biostats.github.io/gsm.core/)}"),
      " package website for full details.",
      "\n", cli::col_red(cli::symbol$info),
      " This package will no longer receive updates after March 2025. To ensure continued support and access to the latest features, we strongly recommend migrating to the new package structure."
    ))
  )
  msg <- paste0(
    load_msg, "\n",
    warning_header, "\n",
    warning_msg
  )
  return(msg)
}

# Show startup message on `library(gsm)`
.onAttach <- function(lib, pkg) {
  # startup message
  msg <- gsmStartupMessage()
  if (!interactive()) {
    msg <- paste("Package 'gsm' version", packageVersion("gsm"))
  }
  packageStartupMessage(msg)
  invisible()
}
