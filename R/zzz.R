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
gsmStartupMessage <- function()
{
  load_msg <- cli::col_white(paste0("This is  version ",
    packageVersion("gsm"), " of the gsm package."))
  warning_header <- cli::col_white(cli::rule(
    left = cli::style_bold("{gsm} Package Deprecation")
    )
  )
  warning_msg <- paste0(
    cli::col_red(cli::symbol$cross),
    cli::col_br_red(paste0(" As of March 2025, {gsm} has been replaced by a series of modularized packages.",
                           "\n", cli::col_red(cli::symbol$cross),
                           " See the ",
                           cli::format_inline("{.href [gsm.core](https://gilead-biostats.github.io/gsm.core/)}"),
                           " package website for full details.",
                           "\n", cli::col_red(cli::symbol$cross),
                           " This package will no longer be updated as of March 2025, so migrating to the new package structure is highly recommended."))
  )
  msg <- paste0(
    load_msg, "\n",
    warning_header, "\n",
    warning_msg
  )
  return(msg)
}

# Show startup message on `library(gsm)`
.onAttach <- function(lib, pkg)
{
  # startup message
  msg <- gsmStartupMessage()
  if(!interactive())
    msg <- paste("Package 'gsm' version", packageVersion("gsm"))
  packageStartupMessage(msg)
  invisible()
}
