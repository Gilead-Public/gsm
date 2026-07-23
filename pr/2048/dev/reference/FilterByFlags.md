# Filter out non-flagged rows on FlagOverTime Widget

Filter a results dataframe so that only metrics across all timepoints
that have at least one flag are kept

## Usage

``` r
FilterByFlags(dfResults, bCurrentlyFlagged = FALSE)
```

## Arguments

- dfResults:

  `data.frame` Analysis results data.

- bCurrentlyFlagged:

  `logical` Include risk signals flagged in most recent snapshot?
  Default: `FALSE`.

## Value

A data frame containing the results with at least one flagged record
over time for an group's individual metric

## Examples

``` r
reportingResults_flags <- FilterByFlags(reportingResults)
```
