# Check if the data and spec are compatible

**\[stable\]**

Check if the data and spec are compatible by comparing the data.frames
and columns in the spec with the data.

## Usage

``` r
CheckSpec(lData, lSpec)
```

## Arguments

- lData:

  A list of data.frames.

- lSpec:

  A list specifying the expected structure of the data.

## Value

This function does not return any value. It either prints a message
indicating that all data.frames and columns in the spec are present in
the data, or throws an error if any data.frame or column is missing.

## Examples

``` r
lData <- list(reporting_bounds = gsm::reportingBounds, reporting_results = gsm::reportingResults)
lSpec <- list(
  reporting_bounds = list(
    Metric = list(type = "numeric"),
    Numerator = list(type = "numeric"),
    LogDenominator = list(type = "numeric"),
    MetricID = list(type = "character")
  ),
  reporting_results = list(
    GroupID = list(type = "character"),
    GroupLevel = list(type = "character"),
    Numerator = list(type = "integer"),
    Denominator = list(type = "integer")
  )
)
CheckSpec(lData, lSpec) # Prints message that everything is found
#> → All 2 data.frame(s) in the spec are present in the data: reporting_bounds, reporting_results
#> → All specified columns in reporting_bounds are in the expected format
#> → All specified columns in reporting_results are in the expected format
#> → All 8 specified column(s) in the spec are present in the data: reporting_bounds$Metric, reporting_bounds$Numerator, reporting_bounds$LogDenominator, reporting_bounds$MetricID, reporting_results$GroupID, reporting_results$GroupLevel, reporting_results$Numerator, reporting_results$Denominator

if (FALSE) { # \dontrun{
lSpec$reporting_groups$NotACol <- list(type = "character")
CheckSpec(lData, lSpec) # Throws error that NotACol is missing
} # }
```
