# Custom logging function that wraps cli messaging

Custom logging function that wraps cli messaging

## Usage

``` r
LogMessage(level, message, cli_detail = NULL, .envir = parent.frame())
```

## Arguments

- level:

  logger levels

- message:

  message to display; may contain glue-style placeholders

- cli_detail:

  for cli style alerts the detail for info

- .envir:

  the environment for glue expressions
